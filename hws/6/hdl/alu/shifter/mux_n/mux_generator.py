import math

class MuxGenerator:
    def __init__(self, n: int = 4, mux_dir: str = "./Ian_Eykamp/circuits/mux_n/generated_muxes") -> None:
        self.n = n
        self.mux_dir = mux_dir
        # generate the .sv file and print it
        sv = self.generate_sv()
        # print(sv)
        self.write_file(sv)

    def write_file(self, txt: str) -> None:
        assert(self.n > 2) # we cannot overwrite mux2, because this referred to in the base case in the above code!
        f = open(f"{self.mux_dir}/mux{self.n}.sv", "w")
        f.write(txt)
        f.close()
    
    def generate_sv(self) -> str:
        n = self.n  # local variable to simplify notation

        file_header = """`timescale 1ns/1ps
`default_nettype none
`include "./mux2.sv"
"""

        n_bits = math.ceil(math.log2(n)) # number of bits in the select bus rounded up to the nearest whole bit
        n_2 = 2 ** n_bits # rounds n up to the nearest multiple of two
        n_half = n_2 / 2 # number of bits in each sub-mux

        module_header = f"""
module mux{n}(a, s, y);

    input [{n - 1}:0] a;
    input [{n_bits - 1}:0] s;
    output logic y; // single bit output of mux
    
    logic [{n_2 - 1}:0] a2; // length n2
    always_comb a2 = {{{{{n_2 - n_bits}{{1'b0}}}}, a}};
""" # I promise this works ^ (double {{ is interpreted as a literal \{ character inside of f-strings)

        module_body = self.recursive_body(layer = n_bits, component_idx = "0", a_start_idx = 0, target = "y", max_layer = n_bits)

        module_footer = """
    
endmodule
"""

        return file_header + module_header + module_body + module_footer

    def recursive_body(self, layer: int, component_idx: str, a_start_idx: int, target: str, max_layer: int) -> str:
        indent = "    " * (max_layer - layer + 1)
        mux_name = f"mux_layer{layer}_{component_idx}{' ' * (layer - 1)}"
        var_name = f"y_layer{layer}_{component_idx}"
        if layer == 0:
            module_body = f"""{indent}always_comb {target} = a2[{a_start_idx}]; // wire"""
        else:
            module_body = f"""{indent}logic [1:0] {var_name};
{self.recursive_body(layer - 1, component_idx + "0", a_start_idx,                    target = var_name + "[0]", max_layer = max_layer)}
{self.recursive_body(layer - 1, component_idx + "1", a_start_idx + 2 ** (layer - 1), target = var_name + "[1]", max_layer = max_layer)}
{indent}mux2 {mux_name}(.a({var_name}), .s(s[{layer - 1}]), .y({target}));"""

        return module_body