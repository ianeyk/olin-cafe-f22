`timescale 1ns/1ps
`default_nettype none
`include "./sum/sum8.sv"
`include "./naive_comparator/comparator2_3.sv"
`include "./naive_comparator/comparator3.sv"

module cell8(current_state, neighbors, next_state);

input current_state;
input [7:0] neighbors;
output logic next_state;

// Below is "STRUCTURAL" verilog - explicit hardware

// Inverters
logic current_state_bar;  
always_comb current_state_bar = ~current_state; // hopefully this is bitwise

// number of alive neighbors
logic [3:0] num_neighbors;
sum8 sum_neighbors(.a(neighbors), .out(num_neighbors));

// stays alive if 2 or 3 alive neighbors
logic next_state_if_alive;
comparator2_3 if_alive(.a(num_neighbors), .out(next_state_if_alive));

// becomes alive if exactly 3 alive neighbors
logic next_state_if_dead;
comparator3 if_dead(.a(num_neighbors), .out(next_state_if_dead));

// determine next state of cell depending on if currently alive or dead
always_comb next_state = (current_state & next_state_if_alive) | (current_state_bar & next_state_if_dead);

endmodule