`timescale 1ns/1ps
`default_nettype none

module comparator3(a, out);

input [3:0] a;
output logic out;

// Below is "STRUCTURAL" verilog - explicit hardware

// Inverters
logic [3:0] a_bar;  
always_comb a_bar = ~a; // hopefully this is bitwise

logic is_3;

// 0011
always_comb is_3 = a_bar[3] & a_bar[2] & a[1] & a[0];

always_comb out = is_3;

endmodule