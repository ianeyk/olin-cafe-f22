`timescale 1ns/1ps
`default_nettype none

`include "../../Ian_Eykamp/circuits/mux/mux2.sv"

module practice(rst, clk, ena, seed, out);
    input rst, clk, ena, seed;
    output logic out;

    logic d0, d1, d2, mux_b;

    always_comb mux_b = d1 ^ d2;
    mux2 mux(.a(seed), .b(mux_b), .s(ena), .y(d0));
    
    always_ff @(posedge clk) begin
        d1 <= d0;
        d2 <= d1;
        out <= d2;
    end

endmodule
