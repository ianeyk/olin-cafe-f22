`timescale 1ns/1ps
`default_nettype none

/*
Sign-extension of the immediate bits
*/
`include "mux4_32.sv"

module immediate_extender(immediate, control, out); // ibuj

input wire [19:0] immediate;
input wire [1:0] control;
output logic [31:0] out;

logic [31:0] out_i, out_b, out_u, out_j;
// mux4_32 extension_selector(.a({out_i, out_b, out_u, out_j}), .s(control), .y(out));
mux4_32 extension_selector(.a({out_j, out_u, out_b, out_i}), .s(control), .y(out));

always_comb out_i = {{20{immediate[11]}}, immediate[11:0]}; // also L-type
always_comb out_b = {{19{immediate[11]}}, immediate[11], immediate[0], immediate[10:5], immediate[4:1], 1'b0};
always_comb out_u = {{12{immediate[19]}}, immediate[19:0]}; // also S-type
always_comb out_j = {{11{immediate[19]}}, immediate[19], immediate[7:0], immediate[8], immediate[18:9], 1'b0};

endmodule
