`timescale 1ns/1ps
`default_nettype none
`include "./generated_muxes/mux8.sv"

module shifter8(a, s, y);

    input [7:0] a;
    input [2:0] s;
    output logic [7:0] y;
        mux8 shifter_bit_0(.a({{7{1'b0}}, a[0:0]}), .s(s), .y(y[0]));
        mux8 shifter_bit_1(.a({{6{1'b0}}, a[1:0]}), .s(s), .y(y[1]));
        mux8 shifter_bit_2(.a({{5{1'b0}}, a[2:0]}), .s(s), .y(y[2]));
        mux8 shifter_bit_3(.a({{4{1'b0}}, a[3:0]}), .s(s), .y(y[3]));
        mux8 shifter_bit_4(.a({{3{1'b0}}, a[4:0]}), .s(s), .y(y[4]));
        mux8 shifter_bit_5(.a({{2{1'b0}}, a[5:0]}), .s(s), .y(y[5]));
        mux8 shifter_bit_6(.a({{1{1'b0}}, a[6:0]}), .s(s), .y(y[6]));
        mux8 shifter_bit_7(.a({{0{1'b0}}, a[7:0]}), .s(s), .y(y[7]));

endmodule