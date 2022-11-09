`include "./adder_n/generated_adders/adder32.sv"
`include "./shifter/generated_shifters/shifter_ll32.sv"
`include "./shifter/generated_shifters/shifter_rl32.sv"
`include "./shifter/generated_shifters/shifter_ra32.sv"
`include "./comparator/comparator_eq.sv"
`include "./comparator/comparator_lt.sv"
`include "./comparator/comparator_lt_unsigned.sv"
`include "./multi_mux/generated_muxes/mux10_32.sv"

`timescale 1ns/1ps
`default_nettype none

module alu(op, a, b, out, overflow, inputs_equal, outputs_zero);

// typedef enum logic [3:0] {
//   ALU_AND  = 4'b0001,
//   ALU_OR   = 4'b0010,
//   ALU_XOR  = 4'b0011,
//   ALU_SLL  = 4'b0101,
//   ALU_SRL  = 4'b0110,
//   ALU_SRA  = 4'b0111,
//   ALU_ADD  = 4'b1000,
//   ALU_SUB  = 4'b1100,
//   ALU_SLT  = 4'b1101,
//   ALU_SLTU = 4'b1111
// } alu_control_t;

input [31:0] a, b;
input [3:0] op; // operator code
output logic [31:0] out;
output logic overflow;
output logic inputs_equal;
output logic outputs_zero;

// Below is "STRUCTURAL" verilog - explicit hardware

always_comb overflow = 1'b0; // overflow detection is not implemented yet

logic [1:0] trash_can;

logic [31:0] and_result;
logic [31:0] or_result;
logic [31:0] xor_result;
logic [31:0] sll_result;
logic [31:0] srl_result;
logic [31:0] sra_result;
logic [31:0] add_result;
logic [31:0] sub_result;
logic slt_result;
logic sltu_result;


logic [32 * 10 - 1:0] all_possible_operations;
always_comb all_possible_operations = {and_result, or_result, xor_result, sll_result, srl_result, sra_result, add_result, sub_result, {32{slt_result}}, {32{sltu_result}}};

always_comb and_result = a & b;
always_comb or_result = a | b;
always_comb xor_result = a ^ b;
shifter_ll32 sll_module(.a(a), .s(b[4:0]), .y(sll_result));
shifter_rl32 srl_module(.a(a), .s(b[4:0]), .y(srl_result));
shifter_ra32 sra_module(.a(a), .s(b[4:0]), .y(sra_result));
adder32 adder_module(.a(a), .b(b), .cin(1'b0), .s(add_result), .cout(trash_can[0]));
logic [31:0] b_bar;
always_comb b_bar = ~b;
adder32 subtractor_module(.a(a), .b(b_bar), .cin(1'b1), .s(sub_result), .cout(trash_can[1]));
comparator_lt less_than_module(.a(a), .b(b), .out(slt_result));
comparator_lt_unsigned less_than_unsigned_module(.a(a), .b(b), .out(sltu_result));

comparator_eq equality_comparator(.a(a), .b(b), .out(inputs_equal));
// always_comb out = and_result;

// mux10_32 operation_selector(.a(all_possible_operations), .s(op), .y(out));
mux10_32 operation_selector(.a(all_possible_operations), .s(5'b0), .y(out));

always_comb outputs_zero = ~(|out);

endmodule