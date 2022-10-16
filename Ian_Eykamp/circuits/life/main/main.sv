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
always_comb initial_state = 64'b00000000_00000000_00000000_00011100_00000000_00000000_00000000_00000000; // blinker

// Below is "STRUCTURAL" verilog - explicit hardware

logic [2:0] tick;
logic every_second;
timer_8tick tick_counter(.clk(clk), .rst(rst), .next_tick(tick));
timer_1second pulse_per_second(.clk(clk), .rst(rst), .output_pulse(every_second));

logic [63:0] prev_cells;
logic [63:0] next_cells;

cell_array cells(.cells_in(prev_cells), .cells_out(next_cells));

always @(posedge(tick)) begin
    logic [7:0] row0;
    row0 = {8{(tick == 3'd0)}} & next_cells[0:7];
    logic [7:0] row1;
    row1 = {8{(tick == 3'd1)}} & next_cells[8:15];
    logic [7:0] row2;
    row2 = {8{(tick == 3'd2)}} & next_cells[16:23];
    logic [7:0] row3;
    row3 = {8{(tick == 3'd3)}} & next_cells[24:31];
    logic [7:0] row4;
    row4 = {8{(tick == 3'd4)}} & next_cells[32:39];
    logic [7:0] row5;
    row5 = {8{(tick == 3'd5)}} & next_cells[40:47];
    logic [7:0] row6;
    row6 = {8{(tick == 3'd6)}} & next_cells[48:55];
    logic [7:0] row7;
    row7 = {8{(tick == 3'd7)}} & next_cells[56:63];

    leds_out = row0 | row1 | row2 | row3 | row4 | row5 | row6 | row7;
end

always @(posedge(every_second)) begin
    prev_cells <= (~rst64 & next_cells) | (rst64 & initial_state);
end

endmodule