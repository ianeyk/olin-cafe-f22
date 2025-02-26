`timescale 1ns/1ps
`default_nettype none
`include "./adder/adder32.sv"

module timer_1second(clk, rst, output_pulse); // 12 MHz

reg [31:0] current_tick;
input wire clk, rst;
output logic output_pulse;

// Below is "STRUCTURAL" verilog - explicit hardware
logic dead_end0, dead_end1;
logic [31:0] next_tick; // which tick are we on? (0-7)
adder32 tick_incrementer(.a(current_tick), .b(32'b0), .cin(1'b1), .s(next_tick), .cout(dead_end0));

logic [31:0] one_second_at_12MHz;
always_comb one_second_at_12MHz = 32'd12_000_000; // USE FOR COMPILING FOR FPGA (1 second timer)
// always_comb one_second_at_12MHz = 32'd22; // USE FOR DEBUGGING AND SIMULAITON TESTS (24-cycle timer)

logic [31:0] comparator_difference;
logic comparator_result;
adder32 tick_comparator(.a(~current_tick), .b(one_second_at_12MHz), .cin(1'b1), .s(comparator_difference), .cout(dead_end1));
always_comb comparator_result = comparator_difference[31];

logic output_pulse_will_be;
always_comb output_pulse_will_be = comparator_difference[31];

logic [31:0] current_tick_will_be;

logic [31:0] rst32;
always_comb rst32 = {32{rst}};
logic [31:0] comparator_result32;
always_comb comparator_result32 = {32{comparator_result}};

always_comb current_tick_will_be = ~rst32 & ~comparator_result32 & next_tick;

// ands
always_ff @(posedge(clk)) begin
    output_pulse <= output_pulse_will_be;
    current_tick <= current_tick_will_be;
    // $display(" --- %b, %b, => %b", comparator_difference, ~comparator_result32, current_tick_will_be);
end

endmodule