`timescale 1ns/1ps
`default_nettype none
`include "./adder/adder3.sv"

module timer_8tick(current_tick, clk, rst, next_tick);

input [2:0] current_tick;
input clk, rst;
output logic [2:0] next_tick; // which tick are we on? (0-7)

// Below is "STRUCTURAL" verilog - explicit hardware
logic dead_end;

adder3 tick_incrementer(.a(current_tick), .b(3`b000), .cin(1`b1), .s(next_tick), .cout(dead_end)); // will loop around

logic [3:0] current_tick_will_be;
always_comb current_tick_will_be = ~rst & next_tick;

// ands
always @(posedge(clk) or posedge(rst)) begin
        current_tick <= current_tick_will_be;
    end
end

endmodule