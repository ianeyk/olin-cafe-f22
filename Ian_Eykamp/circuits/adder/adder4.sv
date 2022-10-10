`include "./adder2.sv"

`timescale 1ns/1ps
`default_nettype none

module adder4(a, b, cin, s, cout);

input [3:0] a, b;
input cin;
output logic [3:0] s; // the last or logic
output logic cout;

// Below is "STRUCTURAL" verilog - explicit hardware

// logic initial_carry_bit;
// always_comb initial_carry_bit = 0;

// 1-2 decoders
logic c1;
adder2 bit01(.a(a[1:0]), .b(b[1:0]), .cin(cin), .s(s[1:0]), .cout(c1));
adder2 bit23(.a(a[3:2]), .b(b[3:2]), .cin(c1),  .s(s[3:2]), .cout(cout));

endmodule