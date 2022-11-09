import math

class AdderGenerator:
    def __init__(self, n: int = 4, adder_dir: str = "./Ian_Eykamp/circuits/adder_n/generated_adders") -> None:
        self.n = n
        self.adder_dir = adder_dir
        # generate the .sv file and print it
        sv = self.generate_sv()
        print(sv)
        self.write_file(sv)

    def write_file(self, txt: str) -> None:
        assert(self.n > 1) # we cannot overwrite adder1, because this referred to in the base case in the above code!
        f = open(f"{self.adder_dir}/adder{self.n}.sv", "w")
        f.write(txt)
        f.close()
    
    def generate_sv(self) -> str:
        n = self.n  # local variable to simplify notation

        file_header = f"""`ifndef INCLUDE_ADDER{n}
`define INCLUDE_ADDER{n}
`timescale 1ns/1ps
`default_nettype none
`include "./adder_n/adder1.sv"
"""

        n_bits = math.ceil(math.log2(n)) # number of bits in the select bus rounded up to the nearest whole bit
        n_2 = 2 ** n_bits # rounds n up to the nearest multiple of two
        n_half = n_2 / 2 # number of bits in each sub-mux

        module_header = f"""
module adder{n}(a, b, cin, s, cout);

    input [{n - 1}:0] a, b;
    input cin;
    output logic [{n - 1}:0] s; // output (sum)
    output logic cout; // output carry bit
    
    // AUTO-GENERATED COMBINATIONAL LOGIC
"""

        module_body = self.recursive_body(layer = 0, target = "cin")

        module_footer = """
    
endmodule

`endif"""

        return file_header + module_header + module_body + module_footer

    def recursive_body(self, layer: int, target: str) -> str:
#         indent = "    " * (max_layer - layer + 1)
#         mux_name = f"mux_layer{layer}_{component_idx}{' ' * (layer - 1)}"
#         var_name = f"y_layer{layer}_{component_idx}"
#         if layer == 0:
#             module_body = f"""{indent}always_comb {target} = a2[{a_start_idx}]; // wire"""
#         else:
#             module_body = f"""{indent}logic [1:0] {var_name};
# {self.recursive_body(layer - 1, component_idx + "0", a_start_idx,                    target = var_name + "[0]", max_layer = max_layer)}
# {self.recursive_body(layer - 1, component_idx + "1", a_start_idx + 2 ** (layer - 1), target = var_name + "[1]", max_layer = max_layer)}
# {indent}mux2 {mux_name}(.a({var_name}), .s(s[{layer - 1}]), .y({target}));"""
        if layer == self.n - 1:
            next_target = "cout"
            adder_name = f"bit{layer}"
            module_body = f"""
    // final bit gets carried out
    adder1 {adder_name}(.a(a[{layer}]), .b(b[{layer}]), .cin({target}), .s(s[{layer}]), .cout({next_target}));"""
        else:
            next_target = f"c{layer}"
            adder_name = f"bit{layer}"
            module_body = f"""    logic {next_target};
    adder1 {adder_name}(.a(a[{layer}]), .b(b[{layer}]), .cin({target}), .s(s[{layer}]), .cout({next_target}));
{self.recursive_body(layer + 1, next_target)}"""

# logic c1;
# adder1 bit0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c1));
# adder1 bit1(.a(a[1]), .b(b[1]), .cin(c1),  .s(s[1]), .cout(cout));


        return module_body