`timescale 1ns/1ps
`default_nettype none
`include "./adder/adder3.sv"

module timer_8tick(clk, rst, tick_out);

input wire clk, rst;
output logic [2:0] tick_out; // which tick are we on? (0-7)

reg bit [2:0] current_tick;     //      WORKS IN SIMULATION
reg bit [2:0] next_tick;        //      WORKS IN SIMULATION
// reg [2:0] current_tick;      //      WORKS IN COMPILER
// reg [2:0] next_tick;         //      WORKS IN COMPILER

// Below is "STRUCTURAL" verilog - explicit hardware
logic dead_end;

adder3 tick_incrementer(.a(current_tick), .b(3'b0), .cin(1'b1), .s(next_tick), .cout(dead_end)); // will loop around

logic [2:0] current_tick_will_be;
always_comb current_tick_will_be = ~rst & next_tick;

// ands
always @(posedge(clk)) begin
    // $display("---%b -- %d", rst, next_tick);
    current_tick <= current_tick_will_be;
    tick_out <= current_tick_will_be;
end

endmodule