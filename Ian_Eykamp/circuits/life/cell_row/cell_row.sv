`timescale 1ns/1ps
`default_nettype none
`include "./cell/cell8.sv"

module cell_row(this_row, top_row, bottom_row, next_state);

input [7:0] this_row, top_row, bottom_row;
output logic [7:0] next_state;

// Below is "STRUCTURAL" verilog - explicit hardware

logic [7:0] cell0neighbors, cell1neighbors, cell2neighbors, cell3neighbors, cell4neighbors, cell5neighbors, cell6neighbors, cell7neighbors;
logic zero;

always_comb zero = 0;

always_comb cell0neighbors = {zero,        this_row[1], zero,       top_row[0], top_row[1], zero,          bottom_row[0], bottom_row[1]};
always_comb cell1neighbors = {this_row[0], this_row[2], top_row[0], top_row[1], top_row[2], bottom_row[0], bottom_row[1], bottom_row[2]};
always_comb cell2neighbors = {this_row[1], this_row[3], top_row[1], top_row[2], top_row[3], bottom_row[1], bottom_row[2], bottom_row[3]};
always_comb cell3neighbors = {this_row[2], this_row[4], top_row[2], top_row[3], top_row[4], bottom_row[2], bottom_row[3], bottom_row[4]};
always_comb cell4neighbors = {this_row[3], this_row[5], top_row[3], top_row[4], top_row[5], bottom_row[3], bottom_row[4], bottom_row[5]};
always_comb cell5neighbors = {this_row[4], this_row[6], top_row[4], top_row[5], top_row[6], bottom_row[4], bottom_row[5], bottom_row[6]};
always_comb cell6neighbors = {this_row[5], this_row[7], top_row[5], top_row[6], top_row[7], bottom_row[5], bottom_row[6], bottom_row[7]};
always_comb cell7neighbors = {this_row[6], zero,        top_row[6], top_row[7], zero,       bottom_row[6], bottom_row[7], zero         };

cell8 cell0(.current_state(this_row[0]), .neighbors(cell0neighbors), .next_state(next_state[0]));
cell8 cell1(.current_state(this_row[1]), .neighbors(cell1neighbors), .next_state(next_state[1]));
cell8 cell2(.current_state(this_row[2]), .neighbors(cell2neighbors), .next_state(next_state[2]));
cell8 cell3(.current_state(this_row[3]), .neighbors(cell3neighbors), .next_state(next_state[3]));
cell8 cell4(.current_state(this_row[4]), .neighbors(cell4neighbors), .next_state(next_state[4]));
cell8 cell5(.current_state(this_row[5]), .neighbors(cell5neighbors), .next_state(next_state[5]));
cell8 cell6(.current_state(this_row[6]), .neighbors(cell6neighbors), .next_state(next_state[6]));
cell8 cell7 (.current_state(this_row[7]), .neighbors(cell7neighbors), .next_state(next_state[7]));

endmodule