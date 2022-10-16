`timescale 1ns/1ps
`default_nettype none
`include "./cell_array/cell_array.sv"
`include "./timer/timer_8tick.sv"
`include "./timer/timer_1second.sv"
`include "./mux/mux8.sv"

module main(clk, rst, leds_out);

input clk, rst;
output logic [7:0] leds_out;

// Below is "STRUCTURAL" verilog - explicit hardware

logic [2:0] tick;
logic every_second;
timer_8tick tick_counter(.clk(clk), .rst(rst), .next_tick(tick));
timer_1second pulse_per_second(.clk(clk), .rst(rst), .output_pulse(every_second));

logic [63:0] prev_cells;
logic [63:0] next_cells;

cell_array cells(.cells_in(), .cells_out());

always @(posedge(tick)) begin

end

always @(posedge(every_second)) begin

end

endmodule