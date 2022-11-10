`include "./multi_mux/generated_muxes/mux32_32"

`timescale 1ns/1ps
`default_nettype none

module register_file(clk, rst, read_port_1_addr, read_port_1_addr, write_port_enable, write_port_addr, read_port_1_output, read_port_2_output);
parameter L = 32;

input rst;
input [4:0] read_port_1_addr;
input [4:0] read_port_2_addr;
input write_port_enable;
input [4:0] write_port_addr;
output logic [31:0] read_port_1_output;
output logic [31:0] read_port_2_output;

logic [L*32-1:0] file;
mux32_32 read_port_1(.a(register_file), .s(read_port_1_addr), .y(read_port_1_output));
mux32_32 read_port_2(.a(register_file), .s(read_port_2_addr), .y(read_port_2_output));

always_ff @(posedge(clk)) begin
    
end


// Below is "STRUCTURAL" verilog - explicit hardware

// logic initial_carry_bit;
// always_comb initial_carry_bit = 0;

// 1-2 decoders
logic c1;
adder1 bit0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c1));
adder1 bit1(.a(a[1]), .b(b[1]), .cin(c1),  .s(s[1]), .cout(cout));

endmodule