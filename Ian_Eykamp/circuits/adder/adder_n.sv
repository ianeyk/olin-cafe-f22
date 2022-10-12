`include "./adder2.sv"

`timescale 1ns/1ps
`default_nettype none

module adder_n #(parameter n = 2) (a, b, cin, s, cout);

input [n-1:0] a, b;
input cin;
output logic [n-1:0] s; // the last or logic
output logic cout;

// Below is "STRUCTURAL" verilog - explicit hardware

// 1-2 decoders
genvar i;
generate
    for (i = 0; i < n)
logic c1;
adder2 bit01(.a(a[1:0]), .b(b[1:0]), .cin(cin), .s(s[1:0]), .cout(c1));
adder2 bit23(.a(a[3:2]), .b(b[3:2]), .cin(c1),  .s(s[3:2]), .cout(cout));
endgenerate

endmodule