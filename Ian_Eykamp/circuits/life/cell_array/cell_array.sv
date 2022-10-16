`timescale 1ns/1ps
`default_nettype none
`include "./cell_row/cell_row.sv"

module cell_array(cells_in, cells_out);

input [63:0] cells_in;
output logic [63:0] cells_out;

// Below is "STRUCTURAL" verilog - explicit hardware

logic [7:0] zero8;
always_comb zero8 = 0;

cell_row row0(.this_row(cells_in[8*1 - 1: 8*0]), .top_row(zero8),                  .bottom_row(cells_in[8*2 - 1: 8*1]), .next_state(cells_out[8*1 - 1: 8*0]));
cell_row row1(.this_row(cells_in[8*2 - 1: 8*1]), .top_row(cells_in[8*1 - 1: 8*0]), .bottom_row(cells_in[8*3 - 1: 8*2]), .next_state(cells_out[8*2 - 1: 8*1]));
cell_row row2(.this_row(cells_in[8*3 - 1: 8*2]), .top_row(cells_in[8*2 - 1: 8*1]), .bottom_row(cells_in[8*4 - 1: 8*3]), .next_state(cells_out[8*3 - 1: 8*2]));
cell_row row3(.this_row(cells_in[8*4 - 1: 8*3]), .top_row(cells_in[8*3 - 1: 8*2]), .bottom_row(cells_in[8*5 - 1: 8*4]), .next_state(cells_out[8*4 - 1: 8*3]));
cell_row row4(.this_row(cells_in[8*5 - 1: 8*4]), .top_row(cells_in[8*4 - 1: 8*3]), .bottom_row(cells_in[8*6 - 1: 8*5]), .next_state(cells_out[8*5 - 1: 8*4]));
cell_row row5(.this_row(cells_in[8*6 - 1: 8*5]), .top_row(cells_in[8*5 - 1: 8*4]), .bottom_row(cells_in[8*7 - 1: 8*6]), .next_state(cells_out[8*6 - 1: 8*5]));
cell_row row6(.this_row(cells_in[8*7 - 1: 8*6]), .top_row(cells_in[8*6 - 1: 8*5]), .bottom_row(cells_in[8*8 - 1: 8*7]), .next_state(cells_out[8*7 - 1: 8*6]));
cell_row row7(.this_row(cells_in[8*8 - 1: 8*7]), .top_row(cells_in[8*7 - 1: 8*6]), .bottom_row(zero8),                  .next_state(cells_out[8*8 - 1: 8*7]));

endmodule