`timescale 1ns/1ps
`default_nettype none
`include "./generated_muxes/mux6.sv"

module shifter_ll6(a, s, y);

    input [5:0] a;
    input [2:0] s;
    output logic [5:0] y;

    mux6 shifter_bit_0(.a({{5{1'b0}}, a[0]}), .s(s), .y(y[0]));
    mux6 shifter_bit_1(.a({{4{1'b0}}, a[0], a[1]}), .s(s), .y(y[1]));
    mux6 shifter_bit_2(.a({{3{1'b0}}, a[0], a[1], a[2]}), .s(s), .y(y[2]));
    mux6 shifter_bit_3(.a({{2{1'b0}}, a[0], a[1], a[2], a[3]}), .s(s), .y(y[3]));
    mux6 shifter_bit_4(.a({{1{1'b0}}, a[0], a[1], a[2], a[3], a[4]}), .s(s), .y(y[4]));
    mux6 shifter_bit_5(.a({{0{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5]}), .s(s), .y(y[5]));

endmodule