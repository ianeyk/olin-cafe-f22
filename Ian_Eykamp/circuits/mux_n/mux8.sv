`timescale 1ns/1ps
`default_nettype none
`include "./mux2.sv"

module mux8(a, s, y);

    input [7:0] a;
    input [2:0] s;
    output logic y; // single bit output of mux
    
    logic [1:0] y_layer3_0;
        logic [1:0] y_layer2_00;
            logic [1:0] y_layer1_000;
                always_comb y_layer1_000[0] = a[0]; // wire
                always_comb y_layer1_000[1] = a[1]; // wire
            mux2 mux_layer1_000(.a(y_layer1_000), .s(s[0]), .y(y_layer2_00[0]));
            logic [1:0] y_layer1_001;
                always_comb y_layer1_001[0] = a[2]; // wire
                always_comb y_layer1_001[1] = a[3]; // wire
            mux2 mux_layer1_001(.a(y_layer1_001), .s(s[0]), .y(y_layer2_00[1]));
        mux2 mux_layer2_00 (.a(y_layer2_00), .s(s[1]), .y(y_layer3_0[0]));
        logic [1:0] y_layer2_01;
            logic [1:0] y_layer1_010;
                always_comb y_layer1_010[0] = a[4]; // wire
                always_comb y_layer1_010[1] = a[5]; // wire
            mux2 mux_layer1_010(.a(y_layer1_010), .s(s[0]), .y(y_layer2_01[0]));
            logic [1:0] y_layer1_011;
                always_comb y_layer1_011[0] = a[6]; // wire
                always_comb y_layer1_011[1] = a[7]; // wire
            mux2 mux_layer1_011(.a(y_layer1_011), .s(s[0]), .y(y_layer2_01[1]));
        mux2 mux_layer2_01 (.a(y_layer2_01), .s(s[1]), .y(y_layer3_0[1]));
    mux2 mux_layer3_0  (.a(y_layer3_0), .s(s[2]), .y(y));
    
endmodule
