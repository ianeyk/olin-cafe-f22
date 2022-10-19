`timescale 1ns/1ps
`default_nettype none
`include "./adder/adder24.sv"

module timer_1second(clk, rst, output_pulse); // 12 MHz

reg [23:0] current_tick;
input wire clk, rst;
output logic output_pulse;

// Below is "STRUCTURAL" verilog - explicit hardware
logic dead_end0, dead_end1;
logic [23:0] next_tick; // which tick are we on? (0-7)
adder24 tick_incrementer(.a(current_tick), .b(24'b0), .cin(1'b1), .s(next_tick), .cout(dead_end0));

logic [23:0] one_second_at_12MHz;
// always_comb one_second_at_12MHz = 24'd12_000_000; // 12 mega (million) // must be two less
always_comb one_second_at_12MHz = 24'd22; // 24'd12_000_000; // 12 mega (million) // must be two less
// for testing, make this 24'd22  ^^^^^^

logic [23:0] comparator_difference;
logic comparator_result;
adder24 tick_comparator(.a(~current_tick), .b(one_second_at_12MHz), .cin(1'b1), .s(comparator_difference), .cout(dead_end1));
always_comb comparator_result = comparator_difference[23];

logic output_pulse_will_be;
always_comb output_pulse_will_be = comparator_difference[23];

logic [23:0] current_tick_will_be;

logic [23:0] rst24;
always_comb rst24 = {24{rst}};
logic [23:0] comparator_result24;
always_comb comparator_result24 = {24{comparator_result}};

always_comb current_tick_will_be = ~rst24 & ~comparator_result24 & next_tick;

// ands
always_ff @(posedge(clk)) begin
    output_pulse <= output_pulse_will_be;
    current_tick <= current_tick_will_be;
    // $display(" --- %b, %b, => %b", comparator_difference, ~comparator_result24, current_tick_will_be);
end

endmodule