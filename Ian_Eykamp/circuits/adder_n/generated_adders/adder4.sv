`timescale 1ns/1ps
`default_nettype none
`include "./adder1.sv"

module adder4(a, b, cin, s, cout);

    input [3:0] a, b;
    input cin;
    output logic [3:0] s; // output (sum)
    output logic cout; // output carry bit
    
    // AUTO-GENERATED COMBINATIONAL LOGIC
    logic c0;
    adder1 bit0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c0));
    logic c1;
    adder1 bit1(.a(a[1]), .b(b[1]), .cin(c0), .s(s[1]), .cout(c1));
    logic c2;
    adder1 bit2(.a(a[2]), .b(b[2]), .cin(c1), .s(s[2]), .cout(c2));

    // final bit gets carried out
    adder1 bit3(.a(a[3]), .b(b[3]), .cin(c2), .s(s[3]), .cout(cout));
    
endmodule
