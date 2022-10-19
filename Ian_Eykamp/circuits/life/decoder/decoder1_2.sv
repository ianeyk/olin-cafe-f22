`timescale 1ns/1ps
`default_nettype none

module decoder1_2(a, en, out);

input wire a, en;
output logic [1:0] out; // the last or logic

// Below is "STRUCTURAL" verilog - explicit hardware

// inverters: ~
logic a_bar;
always_comb a_bar = ~a;

// ands 
logic product0, product1, product2, product3;
always_comb out[0] = en & a_bar;
always_comb out[1] = en & a;

endmodule