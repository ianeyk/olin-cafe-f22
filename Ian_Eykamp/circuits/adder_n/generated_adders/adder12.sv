`timescale 1ns/1ps
`default_nettype none
`include "./adder1.sv"

module adder12(a, b, cin, s, cout);

    input [11:0] a, b;
    input cin;
    output logic [11:0] s; // output (sum)
    output logic cout; // output carry bit
    
    // AUTO-GENERATED COMBINATIONAL LOGIC
    logic c0;
    adder1 bit0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c0));
    logic c1;
    adder1 bit1(.a(a[1]), .b(b[1]), .cin(c0), .s(s[1]), .cout(c1));
    logic c2;
    adder1 bit2(.a(a[2]), .b(b[2]), .cin(c1), .s(s[2]), .cout(c2));
    logic c3;
    adder1 bit3(.a(a[3]), .b(b[3]), .cin(c2), .s(s[3]), .cout(c3));
    logic c4;
    adder1 bit4(.a(a[4]), .b(b[4]), .cin(c3), .s(s[4]), .cout(c4));
    logic c5;
    adder1 bit5(.a(a[5]), .b(b[5]), .cin(c4), .s(s[5]), .cout(c5));
    logic c6;
    adder1 bit6(.a(a[6]), .b(b[6]), .cin(c5), .s(s[6]), .cout(c6));
    logic c7;
    adder1 bit7(.a(a[7]), .b(b[7]), .cin(c6), .s(s[7]), .cout(c7));
    logic c8;
    adder1 bit8(.a(a[8]), .b(b[8]), .cin(c7), .s(s[8]), .cout(c8));
    logic c9;
    adder1 bit9(.a(a[9]), .b(b[9]), .cin(c8), .s(s[9]), .cout(c9));
    logic c10;
    adder1 bit10(.a(a[10]), .b(b[10]), .cin(c9), .s(s[10]), .cout(c10));
    logic c11;
    adder1 bit11(.a(a[11]), .b(b[11]), .cin(c10), .s(s[11]), .cout(c11));

    // final bit gets carried out
    adder1 bit12(.a(a[12]), .b(b[12]), .cin(c11), .s(s[12]), .cout(cout));
    
endmodule
