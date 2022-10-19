`timescale 1ns/1ps
`default_nettype none
`include "./mux/mux2.sv"

module mux4(a, s, y);

    input [3:0] a;
    input [1:0] s;
    output logic y; // the last or logic

    // Below is "STRUCTURAL" verilog - explicit hardware
    logic [1:0] y_0;
    mux2 mux_0_0(.a(a[1:0]), .s(s[0]), .y(y_0[0]));
    mux2 mux_0_1(.a(a[3:2]), .s(s[0]), .y(y_0[1]));
    mux2 mux_1_0(.a(y_0),    .s(s[1]), .y(y));

endmodule