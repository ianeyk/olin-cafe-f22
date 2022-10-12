import math

def generate_mux_n(n: int = 4) -> str:

    file_header = """
`timescale 1ns/1ps
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
    
"""

    module_body = recursive_body(layer = n_bits, component_idx = "0", a_start_idx = 0, target = "y", max_layer = n_bits)

    module_footer = """
    
endmodule
"""

    return file_header + module_header + module_body + module_footer

def recursive_body(layer: int, component_idx: str, a_start_idx: int, target: str, max_layer: int) -> str:
    indent = "    " * (max_layer - layer + 1)
    mux_name = f"mux_layer{layer}_{component_idx}{' ' * (layer - 1)}"
    var_name = f"y_layer{layer}_{component_idx}"
    if layer == 0:
        module_body = f"""{indent}always_comb {target} = a[{a_start_idx}]; // wire"""
    else:
        module_body = f"""{indent}logic [1:0] {var_name};
{recursive_body(layer - 1, component_idx + "0", a_start_idx,                    target = var_name + "[0]", max_layer = max_layer)}
{recursive_body(layer - 1, component_idx + "1", a_start_idx + 2 ** (layer - 1), target = var_name + "[1]", max_layer = max_layer)}
{indent}mux2 {mux_name}(.a({var_name}), .s(s[{layer - 1}]), .y({target}));"""
    # mux_n #(.n(`n1)) mux_0(.a(a2[`n1-1:0]), .s(s[`ns-2:0]), .y(y_0[0]));
    # mux_n #(.n(`n1)) mux_1(.a(a2[`n2-1:`n1]),  .s(s[`ns-2:0]), .y(y_0[1]));
    # mux2 mux(.a(y_0), .s(s[`ns-1]), .y(y)); // combine the above two muxes together

#     module_body = f"""
#     logic [1:0] y_0;
#     mux2 mux_0_0(.a(a[1:0]), .s(s[0]), .y(y_0[0]));
#     mux2 mux_0_1(.a(a[3:2]), .s(s[0]), .y(y_0[1]));
#     mux2 mux_1_0(.a(y_0),    .s(s[1]), .y(y));
# """
    return module_body

def generate_sv(txt: str, n: int) -> None:
    f = open(f"./Ian_Eykamp/circuits/mux_n/mux{n}.sv", "w")
    f.write(txt)
    f.close()

print(generate_mux_n(4))
generate_sv(generate_mux_n(4), 4)