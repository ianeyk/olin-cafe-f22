`include "./adder3.sv"

`timescale 1ns/1ps
`default_nettype none

module sum8(a, out);

input [7:0] a;
output logic [3:0] out;

// Below is "STRUCTURAL" verilog - explicit hardware

logic initial_carry_bit;
always_comb initial_carry_bit = 0;

// 1-bit adder outputs, 
// 2-bit adder inputs
logic [1:0] a2_0_a;
logic [1:0] a2_0_b;
logic [1:0] a2_1_a;
logic [1:0] a2_1_b;

adder1 adder1_0(.a(a[0]), .b(a[1]), .cin(initial_carry_bit), .s(a2_0_a[0]), .cout(a2_0_a[1]));
adder1 adder1_1(.a(a[2]), .b(a[3]), .cin(initial_carry_bit), .s(a2_0_b[0]), .cout(a2_0_b[1]));
adder1 adder1_2(.a(a[4]), .b(a[5]), .cin(initial_carry_bit), .s(a2_1_a[0]), .cout(a2_1_a[1]));
adder1 adder1_3(.a(a[6]), .b(a[7]), .cin(initial_carry_bit), .s(a2_1_b[0]), .cout(a2_1_b[1]));

// 2-bit adder outputs, 
// 3-bit adder inputs
logic [2:0] a3_0_a;
logic [2:0] a3_0_b;

adder2 adder2_0(.a(a2_0_a), .b(a2_0_b), .cin(initial_carry_bit), .s(a3_0_a[1:0]), .cout(a3_0_a[2]));
adder2 adder2_1(.a(a2_1_a), .b(a2_1_b), .cin(initial_carry_bit), .s(a3_0_b[1:0]), .cout(a3_0_b[2]));

// 3-bit adder output
// output of 8-number adder
// logic [3:0] out
adder3 adder3_0(.a(a3_0_a), .b(a3_0_b), .cin(initial_carry_bit), .s(out[2:0]), .cout(out[3]));

endmodule