`include "./adder/adder1.sv"

`timescale 1ns/1ps
`default_nettype none

module adder2(a, b, cin, s, cout);

input wire [1:0] a, b;
input wire cin;
output logic [1:0] s; // the last or logic
output logic cout;

// Below is "STRUCTURAL" verilog - explicit hardware

// logic initial_carry_bit;
// always_comb initial_carry_bit = 0;

// 1-2 decoders
logic c1;
adder1 bit0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c1));
adder1 bit1(.a(a[1]), .b(b[1]), .cin(c1),  .s(s[1]), .cout(cout));

endmodule