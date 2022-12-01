`timescale 1ns/1ps
`default_nettype none

`include "alu_types.sv"
`include "instruction_parse_defines.sv"
`include "comparator_eq.sv"


typedef enum logic [2:0] {
  R_TYPE = 3'd0,
  I_TYPE = 3'd1,
  L_TYPE = 3'd2,
  S_TYPE = 3'd3,
  B_TYPE = 3'd4,
  U_TYPE = 3'd5,
  J_TYPE = 3'd6,
  UNDEFINED = 3'bxxx
} instruction_t;

module op_code_lookup(instruction, instruction_type);

input wire [31:0] instruction;
output instruction_t instruction_type;

logic [6:0] op_code;
always_comb op_code = instruction[6:0];

logic is_r_type, is_i_type, is_l_type, is_s_type, is_b_type, is_u_type, is_j_type;

comparator_eq #(.N(7)) assert_if_r_type(.a(op_code), .b(7'd51),  .out(is_r_type));
comparator_eq #(.N(7)) assert_if_i_type(.a(op_code), .b(7'd19),  .out(is_i_type));
comparator_eq #(.N(7)) assert_if_l_type(.a(op_code), .b(7'd3 ),  .out(is_l_type));
comparator_eq #(.N(7)) assert_if_s_type(.a(op_code), .b(7'd35),  .out(is_s_type));
comparator_eq #(.N(7)) assert_if_b_type(.a(op_code), .b(7'd99),  .out(is_b_type));
comparator_eq #(.N(7)) assert_if_u_type(.a(op_code), .b(7'd55),  .out(is_u_type));
comparator_eq #(.N(7)) assert_if_j_type(.a(op_code), .b(7'd111), .out(is_j_type));

always_comb begin
    if (is_r_type)
        instruction_type = R_TYPE;
    else if (is_i_type)
        instruction_type = I_TYPE;
    else if (is_l_type)
        instruction_type = L_TYPE;
    else if (is_s_type)
        instruction_type = S_TYPE;
    else if (is_b_type)
        instruction_type = B_TYPE;
    else if (is_u_type)
        instruction_type = U_TYPE;
    else if (is_j_type)
        instruction_type = J_TYPE;
    else instruction_type = UNDEFINED;
end

endmodule

module r_type_alu_op_lookup(instruction, alu_operation);

input wire [31:0] instruction;
output alu_control_t alu_operation;

logic [2:0] funct3;
always_comb funct3 = instruction[`FUNCT3_START:`FUNCT3_END];
// always_comb funct3 = instruction[14:12];
logic [6:0] funct7;
always_comb funct7 = instruction[`FUNCT7_START:`FUNCT7_END];
// always_comb funct7 = instruction[31:25];

logic is_add_sub, is_sll, is_slt, is_sltu, is_xor, is_srl_sra, is_or, is_and, is_alternative;

comparator_eq #(.N(3)) assert_if_alu_add_sub(.a(funct3), .b(3'b000), .out(is_add_sub));
comparator_eq #(.N(3)) assert_if_alu_sll(    .a(funct3), .b(3'b001), .out(is_sll));
comparator_eq #(.N(3)) assert_if_alu_slt(    .a(funct3), .b(3'b010), .out(is_slt));
comparator_eq #(.N(3)) assert_if_alu_sltu(   .a(funct3), .b(3'b011), .out(is_sltu));
comparator_eq #(.N(3)) assert_if_alu_xor(    .a(funct3), .b(3'b100), .out(is_xor));
comparator_eq #(.N(3)) assert_if_alu_srl_sra(.a(funct3), .b(3'b101), .out(is_srl_sra));
comparator_eq #(.N(3)) assert_if_alu_or (    .a(funct3), .b(3'b110), .out(is_or));
comparator_eq #(.N(3)) assert_if_alu_and(    .a(funct3), .b(3'b111), .out(is_and));

comparator_eq #(.N(7)) alternative_definition(.a(funct7), .b(7'b0100000), .out(is_alternative));

always_comb begin
    if (is_add_sub & ~is_alternative)
        alu_operation = ALU_ADD;
    else if (is_add_sub & is_alternative)
        alu_operation = ALU_SUB;
    else if (is_sll)
        alu_operation = ALU_SLL;
    else if (is_slt)
        alu_operation = ALU_SLT;
    else if (is_sltu)
        alu_operation = ALU_SLTU;
    else if (is_xor)
        alu_operation = ALU_XOR;
    else if (is_srl_sra & ~is_alternative)
        alu_operation = ALU_SRL;
    else if (is_srl_sra & is_alternative)
        alu_operation = ALU_SRA;
    else if (is_or)
        alu_operation = ALU_OR;
    else if (is_and)
        alu_operation = ALU_AND;
    else
        alu_operation = ALU_INVALID;
end

endmodule

module i_type_alu_op_lookup(instruction, alu_operation);

input wire [31:0] instruction;
output alu_control_t alu_operation;

logic [2:0] funct3;
always_comb funct3 = instruction[`FUNCT3_START:`FUNCT3_END];
// always_comb funct3 = instruction[14:12];
logic [6:0] funct7;
always_comb funct7 = instruction[`FUNCT7_START:`FUNCT7_END];
// always_comb funct7 = instruction[31:25];

logic is_add, is_sll, is_slt, is_sltu, is_xor, is_srl_sra, is_or, is_and, is_alternative, other_bits_zero;

comparator_eq #(.N(3)) assert_if_alu_add(    .a(funct3), .b(3'b000), .out(is_add));
comparator_eq #(.N(3)) assert_if_alu_sll(    .a(funct3), .b(3'b001), .out(is_sll));
comparator_eq #(.N(3)) assert_if_alu_slt(    .a(funct3), .b(3'b010), .out(is_slt));
comparator_eq #(.N(3)) assert_if_alu_sltu(   .a(funct3), .b(3'b011), .out(is_sltu));
comparator_eq #(.N(3)) assert_if_alu_xor(    .a(funct3), .b(3'b100), .out(is_xor));
comparator_eq #(.N(3)) assert_if_alu_srl_sra(.a(funct3), .b(3'b101), .out(is_srl_sra));
comparator_eq #(.N(3)) assert_if_alu_or (    .a(funct3), .b(3'b110), .out(is_or));
comparator_eq #(.N(3)) assert_if_alu_and(    .a(funct3), .b(3'b111), .out(is_and));

comparator_eq #(.N(7)) needs_additional_check(.a(funct7), .b(7'b0000000), .out(other_bits_zero));
comparator_eq #(.N(7)) alternative_definition(.a(funct7), .b(7'b0100000), .out(is_alternative));

always_comb begin
    if (is_add)
        alu_operation = ALU_ADD;
    else if (is_sll & other_bits_zero)
        alu_operation = ALU_SLL;
    else if (is_slt)
        alu_operation = ALU_SLT;
    else if (is_sltu)
        alu_operation = ALU_SLTU;
    else if (is_xor)
        alu_operation = ALU_XOR;
    else if (is_srl_sra & other_bits_zero)
        alu_operation = ALU_SRL;
    else if (is_srl_sra & is_alternative)
        alu_operation = ALU_SRA;
    else if (is_or)
        alu_operation = ALU_OR;
    else if (is_and)
        alu_operation = ALU_AND;
    else
        alu_operation = ALU_INVALID;
end

endmodule