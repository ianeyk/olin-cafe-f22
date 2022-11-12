`timescale 1ns/1ps
`default_nettype none
`include "./generated_muxes/mux11.sv"

module shifter_rl11(a, s, y);

    input [10:0] a;
    input [3:0] s;
    output logic [10:0] y;

    mux11 shifter_bit_0(.a({{0{1'b0}}, a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}), .s(s), .y(y[0]));
    mux11 shifter_bit_1(.a({{1{1'b0}}, a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1]}), .s(s), .y(y[1]));
    mux11 shifter_bit_2(.a({{2{1'b0}}, a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2]}), .s(s), .y(y[2]));
    mux11 shifter_bit_3(.a({{3{1'b0}}, a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3]}), .s(s), .y(y[3]));
    mux11 shifter_bit_4(.a({{4{1'b0}}, a[10], a[9], a[8], a[7], a[6], a[5], a[4]}), .s(s), .y(y[4]));
    mux11 shifter_bit_5(.a({{5{1'b0}}, a[10], a[9], a[8], a[7], a[6], a[5]}), .s(s), .y(y[5]));
    mux11 shifter_bit_6(.a({{6{1'b0}}, a[10], a[9], a[8], a[7], a[6]}), .s(s), .y(y[6]));
    mux11 shifter_bit_7(.a({{7{1'b0}}, a[10], a[9], a[8], a[7]}), .s(s), .y(y[7]));
    mux11 shifter_bit_8(.a({{8{1'b0}}, a[10], a[9], a[8]}), .s(s), .y(y[8]));
    mux11 shifter_bit_9(.a({{9{1'b0}}, a[10], a[9]}), .s(s), .y(y[9]));
    mux11 shifter_bit_10(.a({{10{1'b0}}, a[10]}), .s(s), .y(y[10]));

endmodule