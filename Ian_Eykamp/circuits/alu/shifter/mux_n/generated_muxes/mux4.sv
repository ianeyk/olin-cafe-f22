`timescale 1ns/1ps
`default_nettype none
`include "./mux2.sv"

module mux4(a, s, y);

    input [3:0] a;
    input [1:0] s;
    output logic y; // single bit output of mux
    
    logic [3:0] a2; // length n2
    always_comb a2 = {{2{1'b0}}, a};
    logic [1:0] y_layer2_0;
        logic [1:0] y_layer1_00;
            always_comb y_layer1_00[0] = a2[0]; // wire
            always_comb y_layer1_00[1] = a2[1]; // wire
        mux2 mux_layer1_00(.a(y_layer1_00), .s(s[0]), .y(y_layer2_0[0]));
        logic [1:0] y_layer1_01;
            always_comb y_layer1_01[0] = a2[2]; // wire
            always_comb y_layer1_01[1] = a2[3]; // wire
        mux2 mux_layer1_01(.a(y_layer1_01), .s(s[0]), .y(y_layer2_0[1]));
    mux2 mux_layer2_0 (.a(y_layer2_0), .s(s[1]), .y(y));
    
endmodule
