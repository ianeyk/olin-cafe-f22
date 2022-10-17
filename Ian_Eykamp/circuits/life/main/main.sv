`timescale 1ns/1ps
`default_nettype none
`include "./cell_array/cell_array.sv"
`include "./timer/timer_8tick.sv"
`include "./timer/timer_1second.sv"
`include "./mux/mux8.sv"

module main(clk, rst, leds_out);

input clk, rst;
output logic [7:0] leds_out;

logic [63:0] rst64;
always_comb rst64 = {64{rst}};

logic [63:0] initial_state;
// always_comb initial_state = 64'b00000000_00000000_00000000_00011100_00000000_00000000_00000000_00000000; // blinker
always_comb initial_state = 64'b00000000_00011100_00000000_00000000_00000000_00000000_00000000_00000000; // blinker

// Below is "STRUCTURAL" verilog - explicit hardware

logic [2:0] tick;
logic every_second;
timer_8tick tick_counter(.clk(clk), .rst(rst), .tick_out(tick));
timer_1second pulse_per_second(.clk(clk), .rst(rst), .output_pulse(every_second));

bit [63:0] prev_cells; // logic [63:0] prev_cells;
bit [63:0] next_cells; // logic [63:0] next_cells;

cell_array cells(.cells_in(prev_cells), .cells_out(next_cells));

logic [7:0] row0;
always_comb row0 = {8{(tick == 3'd0)}} & next_cells[7:0];
logic [7:0] row1;
always_comb row1 = {8{(tick == 3'd1)}} & next_cells[15:8];
logic [7:0] row2;
always_comb row2 = {8{(tick == 3'd2)}} & next_cells[23:16];
logic [7:0] row3;
always_comb row3 = {8{(tick == 3'd3)}} & next_cells[31:24];
logic [7:0] row4;
always_comb row4 = {8{(tick == 3'd4)}} & next_cells[39:32];
logic [7:0] row5;
always_comb row5 = {8{(tick == 3'd5)}} & next_cells[47:40];
logic [7:0] row6;
always_comb row6 = {8{(tick == 3'd6)}} & next_cells[55:48];
logic [7:0] row7;
always_comb row7 = {8{(tick == 3'd7)}} & next_cells[63:56];

bit [63:0] prev_cells_will_be;
always_comb prev_cells_will_be = (~rst64 & next_cells) | (rst64 & initial_state);

always @(tick) begin
    // $display("tick: %d, every_second: %b", tick, every_second);
    // $display("tick: %d, cell_state = %b", tick, prev_cells);
    // $display("rst: %b", rst);
    // $display("prev_cells_will_be: %b", prev_cells_will_be);

    leds_out = row0 | row1 | row2 | row3 | row4 | row5 | row6 | row7;
end

always @(posedge(every_second) or rst) begin
    $display("EVERY SECOND");
    prev_cells <= prev_cells_will_be;
    // prev_cells <= (~rst64 & next_cells) | (rst64 & initial_state);
    // $display("cell state = %b", prev_cells);
end

endmodule