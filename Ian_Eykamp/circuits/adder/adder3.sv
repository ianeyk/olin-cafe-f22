`include "./adder2.sv"

`timescale 1ns/1ps
`default_nettype none

module adder3(a, b, cin, s, cout);

input [2:0] a, b;
input cin;
output logic [2:0] s; // the last or logic
output logic cout;

// Below is "STRUCTURAL" verilog - explicit hardware

// logic initial_carry_bit;
// always_comb initial_carry_bit = 0;

// 1-2 decoders
logic c1;
adder1 bit0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c1));
adder2 bit12(.a(a[2:1]), .b(b[2:1]), .cin(c1),  .s(s[2:1]), .cout(cout));

endmodule