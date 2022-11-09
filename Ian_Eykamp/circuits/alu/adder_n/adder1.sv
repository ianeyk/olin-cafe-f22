`ifndef INCLUDE_ADDER1
`define INCLUDE_ADDER1

`timescale 1ns/1ps
`default_nettype none

module adder1(a, b, cin, s, cout);

input a, b, cin;
output logic s, cout; // the last or logic

// Below is "STRUCTURAL" verilog - explicit hardware

// inverters ~
logic a_bar, b_bar, cin_bar;

always_comb a_bar = ~a;
always_comb b_bar = ~b;
always_comb cin_bar = ~cin;

// ands
always_comb s =    (a & b_bar & cin_bar) | (a_bar & b & cin_bar) | (a_bar & b_bar & cin) | (a & b & cin);
always_comb cout = (a_bar & b & cin)     | (a & b_bar & cin)     | (a & b & cin_bar)     | (a & b & cin);

endmodule

`endif