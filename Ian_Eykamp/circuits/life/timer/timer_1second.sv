`timescale 1ns/1ps
`default_nettype none
`include "./adder/adder24.sv"

module timer_1second(current_tick, clk, rst, output_pulse); // 12 MHz

input [23:0] current_tick;
input clk, rst;
output logic output_pulse;

// Below is "STRUCTURAL" verilog - explicit hardware
logic dead_end;
logic [23:0] next_tick; // which tick are we on? (0-7)
adder24 tick_incrementer(.a(current_tick), .b(24`b0), .cin(1`b1), .s(next_tick), .cout(dead_end));

logic [23:0] one_second_at_12MHz;
always_comb one_second_at_12MHz = 24`d12_000_000; // 12 mega (million)

logic [23:0] comparator_difference;
logic [23:0] comparator_result;
adder24 tick_comparator(.a(~current_tick), .b(one_second_at_12MHz), .cin(1`b1), .s(comparator_difference), .cout(dead_end));
always_comb comparator_result = comparator_difference[23];

always_comb output_pulse = comparator_difference[23];

logic [23:0] current_tick_will_be;
always_comb current_tick_will_be = ~rst & ~comparator_result & next_tick;

// ands
always @(posedge(clk) or posedge(rst)) begin
        current_tick <= current_tick_will_be;
    end
end

endmodule