import math

class LeftShifterGenerator:
    def __init__(self, n: int = 4, mux_dir: str = "./Ian_Eykamp/circuits/mux_n/generated_muxes") -> None:
        self.n = n
        self.mux_dir = mux_dir
        self.module_name = f"shifter_ll{n}"
        # generate the .sv file and print it
        sv = self.generate_sv()
        # print(sv)
        self.write_file(sv)

    def write_file(self, txt: str) -> None:
        assert(self.n > 2) # we cannot overwrite mux2, because this referred to in the base case in the above code!
        f = open(f"{self.mux_dir}/{self.module_name}.sv", "w")
        f.write(txt)
        f.close()
    
    def generate_sv(self) -> str:
        n = self.n  # local variable to simplify notation

        file_header = f"""`timescale 1ns/1ps
`default_nettype none
`include "./shifter/generated_muxes/mux{n}.sv"
"""

        n_bits = math.ceil(math.log2(n)) # number of bits in the select bus rounded up to the nearest whole bit
        n_2 = 2 ** n_bits # rounds n up to the nearest multiple of two
        n_half = n_2 / 2 # number of bits in each sub-mux

        module_header = f"""
module {self.module_name}(a, s, y);

    input [{n - 1}:0] a;
    input [{n_bits - 1}:0] s;
    output logic [{n - 1}:0] y;
"""

        indent = " " * 4
        module_body = """
"""
        for bit in range(n):
            a_select = "".join([f", a[{b}]" for b in range(bit + 1)])
            # module_body += f"""{indent}mux{n} shifter_bit_{bit}(.a({{{{{n - bit - 1}{{1'b0}}}}, a[{bit}:0]}}), .s(s), .y(y[{bit}]));
            module_body += f"""{indent}mux{n} shifter_bit_{bit}(.a({{{{{n - bit - 1}{{1'b0}}}}{a_select}}}), .s(s), .y(y[{bit}]));
"""
            pass
        # module_body = self.recursive_body(layer = n_bits, component_idx = "0", a_start_idx = 0, target = "y", max_layer = n_bits)

        module_footer = """
endmodule"""

        return file_header + module_header + module_body + module_footer