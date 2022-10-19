`include "./decoder/decoder2_4.sv"

`timescale 1ns/1ps
`default_nettype none

module decoder3_8(a, en, out);

input en;
input [2:0] a;
output logic [7:0] out; // the last or logic

// Below is "STRUCTURAL" verilog - explicit hardware

// 1-2 decoders
logic [1:0] aout;
decoder1_2 decoder0( .a(a[2]),   .en(en),      .out(aout));
decoder2_4 decoder00(.a(a[1:0]), .en(aout[0]), .out(out[3:0]));
decoder2_4 decoder01(.a(a[1:0]), .en(aout[1]), .out(out[7:4]));

endmodule