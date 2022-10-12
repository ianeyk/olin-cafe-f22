`timescale 1ns/1ps
`default_nettype none
`include "./adder1.sv"

module adder30(a, b, cin, s, cout);

    input [29:0] a, b;
    input cin;
    output logic [29:0] s; // output (sum)
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
    logic c12;
    adder1 bit12(.a(a[12]), .b(b[12]), .cin(c11), .s(s[12]), .cout(c12));
    logic c13;
    adder1 bit13(.a(a[13]), .b(b[13]), .cin(c12), .s(s[13]), .cout(c13));
    logic c14;
    adder1 bit14(.a(a[14]), .b(b[14]), .cin(c13), .s(s[14]), .cout(c14));
    logic c15;
    adder1 bit15(.a(a[15]), .b(b[15]), .cin(c14), .s(s[15]), .cout(c15));
    logic c16;
    adder1 bit16(.a(a[16]), .b(b[16]), .cin(c15), .s(s[16]), .cout(c16));
    logic c17;
    adder1 bit17(.a(a[17]), .b(b[17]), .cin(c16), .s(s[17]), .cout(c17));
    logic c18;
    adder1 bit18(.a(a[18]), .b(b[18]), .cin(c17), .s(s[18]), .cout(c18));
    logic c19;
    adder1 bit19(.a(a[19]), .b(b[19]), .cin(c18), .s(s[19]), .cout(c19));
    logic c20;
    adder1 bit20(.a(a[20]), .b(b[20]), .cin(c19), .s(s[20]), .cout(c20));
    logic c21;
    adder1 bit21(.a(a[21]), .b(b[21]), .cin(c20), .s(s[21]), .cout(c21));
    logic c22;
    adder1 bit22(.a(a[22]), .b(b[22]), .cin(c21), .s(s[22]), .cout(c22));
    logic c23;
    adder1 bit23(.a(a[23]), .b(b[23]), .cin(c22), .s(s[23]), .cout(c23));
    logic c24;
    adder1 bit24(.a(a[24]), .b(b[24]), .cin(c23), .s(s[24]), .cout(c24));
    logic c25;
    adder1 bit25(.a(a[25]), .b(b[25]), .cin(c24), .s(s[25]), .cout(c25));
    logic c26;
    adder1 bit26(.a(a[26]), .b(b[26]), .cin(c25), .s(s[26]), .cout(c26));
    logic c27;
    adder1 bit27(.a(a[27]), .b(b[27]), .cin(c26), .s(s[27]), .cout(c27));
    logic c28;
    adder1 bit28(.a(a[28]), .b(b[28]), .cin(c27), .s(s[28]), .cout(c28));

    // final bit gets carried out
    adder1 bit29(.a(a[29]), .b(b[29]), .cin(c28), .s(s[29]), .cout(cout));
    
endmodule
