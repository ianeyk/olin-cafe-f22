`include "./decoder1_2.sv"

`timescale 1ns/1ps
`default_nettype none

module decoder2_4(a, en, out);

input en;
input [1:0] a;
output logic [3:0] out; // the last or logic

// Below is "STRUCTURAL" verilog - explicit hardware

// 1-2 decoders
logic [1:0] aout;
decoder1_2 decoder0( .a(a[1]), .en(en),      .out(aout));
decoder1_2 decoder00(.a(a[0]), .en(aout[0]), .out(out[1:0]));
decoder1_2 decoder01(.a(a[0]), .en(aout[1]), .out(out[3:2]));

endmodule