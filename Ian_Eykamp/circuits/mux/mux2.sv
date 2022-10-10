`timescale 1ns/1ps
`default_nettype none

module mux2(a, b, s, y);

    input a, b, s;
    output logic y; // the last or logic

    // Below is "STRUCTURAL" verilog - explicit hardware

    // inverters: ~
    logic s_bar;
    always_comb s_bar = ~s;

    // logic was declared up top.
    always_comb y = (s_bar & a) | (s & b);

endmodule