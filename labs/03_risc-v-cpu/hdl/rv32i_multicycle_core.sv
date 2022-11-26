`timescale 1ns/1ps
`default_nettype none

`include "alu_types.sv"
`include "rv32i_defines.sv"
`include "instruction_parse_defines.sv"

`define RS2_START 24
`define RS2_END 20

`define RS1_START 19
`define RS1_END 15

`define FUNCT3_START 14
`define FUNCT3_END 12

`define FUNCT7_START 31
`define FUNCT7_END 25

`define OP_START 6
`define OP_END 0

`define RS1_START 19
`define RS1_END 15

`define RD_START 11
`define RS2_END 7

`define I_TYPE_IMM_START 31
`define I_TYPE_IMM_END 20

`define S_TYPE_IMM_1_START 31
`define S_TYPE_IMM_1_END 25

`define S_TYPE_IMM_2_START 11
`define S_TYPE_IMM_2_END 7

`define B_TYPE_IMM_1_START 31
`define B_TYPE_IMM_1_END 25

`define B_TYPE_IMM_2_START 11
`define B_TYPE_IMM_2_END 7

`define U_TYPE_IMM_START 31
`define U_TYPE_IMM_END 12

`define J_TYPE_IMM_START 31
`define J_TYPE_IMM_END 12




module rv32i_multicycle_core(
  clk, rst, ena,
  mem_addr, mem_rd_data, mem_wr_data, mem_wr_ena,
  PC
);

parameter PC_START_ADDRESS=0;

// Standard control signals.
input  wire clk, rst, ena; // <- worry about implementing the ena signal last.

// Memory interface.
output logic [31:0] mem_addr, mem_wr_data;
input   wire [31:0] mem_rd_data;
output logic mem_wr_ena;

// Program Counter
output wire [31:0] PC;
wire [31:0] PC_old;
logic PC_ena;
logic [31:0] PC_next;

// Program Counter Registers
register #(.N(32), .RESET(PC_START_ADDRESS)) PC_REGISTER (
  .clk(clk), .rst(rst), .ena(PC_ena), .d(PC_next), .q(PC)
);
register #(.N(32)) PC_OLD_REGISTER(
  .clk(clk), .rst(rst), .ena(PC_ena), .d(PC), .q(PC_old)
);

//  an example of how to make named inputs for a mux:
/*
    enum logic {MEM_SRC_PC, MEM_SRC_RESULT} mem_src;
    always_comb begin : memory_read_address_mux
      case(mem_src)
        MEM_SRC_RESULT : mem_rd_addr = alu_result;
        MEM_SRC_PC : mem_rd_addr = PC;
        default: mem_rd_addr = 0;
    end
*/

// Register file
logic reg_write;
logic [4:0] rd, rs1, rs2;
logic [31:0] rfile_wr_data;
wire [31:0] reg_data1, reg_data2;
register_file REGISTER_FILE(
  .clk(clk), 
  .wr_ena(reg_write), .wr_addr(rd), .wr_data(rfile_wr_data),
  .rd_addr0(rs1), .rd_addr1(rs2),
  .rd_data0(reg_data1), .rd_data1(reg_data2)
);

// ALU and related control signals
// Feel free to replace with your ALU from the homework.
logic [31:0] alu_src_a, alu_src_b;
alu_control_t alu_control;
wire [31:0] alu_result_temp;
wire overflow, zero, equal;
alu_behavioural ALU (
  .a(alu_src_a), .b(alu_src_b), .result(alu_result_temp), // temporary, because the value will be permanently stored in a register with the name alu_result
  .control(alu_control),
  .overflow(overflow), .zero(zero), .equal(equal)
);

// Implement your multicycle rv32i CPU here!
logic instruction_store_ena;
logic [31:0] instruction;
register #(.N(32)) instruction_store(.clk(clk), .ena(instruction_store_ena), .rst(rst), .d(mem_rd_data), .q(instruction));

logic memory_read_ena;
logic [31:0] memory_value;
register #(.N(32)) memory_store(.clk(clk), .ena(memory_read_ena), .rst(rst), .d(mem_rd_data), .q(memory_value));

logic alu_src_store_ena;
register #(.N(32)) alu_src_a_store(.clk(clk), .ena(alu_src_store_ena), .rst(rst), .d(reg_data1), .q(alu_src_a));
register #(.N(32)) alu_src_b_store(.clk(clk), .ena(alu_src_store_ena), .rst(rst), .d(reg_data2), .q(alu_src_b));

logic alu_result_store_ena;
wire [31:0] alu_result;
register #(.N(32)) alu_result_store(.clk(clk), .ena(alu_result_store_ena), .rst(rst), .d(alu_result_temp), .q(alu_result));

wire [31:0] immediate_extended;
wire [19:0] immediate;
logic [1:0] imm_control;
immediate_extender imm_extender(.immediate(immediate), .control(imm_control), .out(immediate_extended));

logic [1:0] output_select;
logic imm_select;
mux2_32 imm_enabler(.a({immediate_extended, reg_data2}), .s(imm_select), .y(alu_src_b));
mux3_32 output_switcher(.a({PC, memory_value, alu_result}), .s(output_select), .y(rfile_wr_data)); // 3, 2, 1 [2:0];

logic [1:0] trash_can;
adder32 PC_incrementer(.a(PC), .b(32'd4), .cin(1'b0), .s(PC_next), .cout(trash_can[0]));

logic [2:0] instruction_type;
logic [6:0] op_code;
always_comb op_code = instruction[6:0];

logic instruction_r_type, instruction_i_type, instruction_l_type, instruction_s_type, instruction_b_type, instruction_u_type, instruction_j_type;
comparator_eq #(.N(32)) is_r_type(.a(op_code), .b(7'd51), .out(instruction_r_type));
comparator_eq #(.N(32)) is_i_type(.a(op_code), .b(7'd19), .out(instruction_i_type));
comparator_eq #(.N(32)) is_l_type(.a(op_code), .b(7'd3 ), .out(instruction_l_type));
comparator_eq #(.N(32)) is_s_type(.a(op_code), .b(7'd35), .out(instruction_s_type));
comparator_eq #(.N(32)) is_b_type(.a(op_code), .b(7'd99), .out(instruction_b_type));
comparator_eq #(.N(32)) is_u_type(.a(op_code), .b(7'd55), .out(instruction_u_type));
comparator_eq #(.N(32)) is_j_type(.a(op_code), .b(7'd111), .out(instruction_j_type));

enum logic [3:0] { IDLE, LOAD_INSTRUCTION, DONE_LOADING_INSTRUCTION,
  R_START, R_READ_REGISTERS, R_ALU, R_WRITE_REGISTERS, R_DONE, 
  I_START, S_START, B_START, U_START, J_START } cpu_controller;

always_ff @(posedge clk) begin : cpu_controller_fsm
  if(rst) begin
    cpu_controller <= IDLE;
    reg_write <= 0;
    imm_control <= 0;
    imm_select <= 0;
    immediate <= 20'b0;
    rs1 <= 0;
    rs2 <= 0;
    rd <= 0;
    instruction_store_ena <= 0;
    alu_src_store_ena <= 0;
    alu_result_store_ena <= 0;
    output_select <= 0;
    memory_read_ena <= 0;
    PC_ena <= 0;
    mem_addr <= PC_START_ADDRESS; // we know there is nothing bad at this address; there might be bad stuff at 0.
    mem_wr_ena <= 0;
    mem_wr_data <= 0;
  end else begin
    if (ena) begin
      case(cpu_controller)
        IDLE : begin // reset all states; everything off
          reg_write <= 0;
          imm_control <= 0;
          imm_select <= 0;
          immediate <= 20'b0;
          rs1 <= 0;
          rs2 <= 0;
          rd <= 0;
          instruction_store_ena <= 0;
          alu_src_store_ena <= 0;
          alu_result_store_ena <= 0;
          output_select <= 0;
          memory_read_ena <= 0;
          PC_ena <= 0;
          mem_addr <= 0;
          mem_wr_ena <= 0;
          mem_wr_data <= 0;
          cpu_controller <= LOAD_INSTRUCTION;
        end
        LOAD_INSTRUCTION : begin
          instruction_store_ena <= 1;
          mem_addr <= PC;
          cpu_controller <= DONE_LOADING_INSTRUCTION;
        end
        DONE_LOADING_INSTRUCTION : begin // save instruction in register, so memory can be used for other things
          instruction_store_ena <= 0;
          if (instruction_r_type)
            cpu_controller <= R_START;
          else if (instruction_i_type)
            cpu_controller <= I_START;
          else if (instruction_l_type)
            cpu_controller <= L_START;
          else if (instruction_s_type)
            cpu_controller <= S_START;
          else if (instruction_b_type)
            cpu_controller <= B_START;
          else if (instruction_u_type)
            cpu_controller <= U_START;
          else if (instruction_j_type)
            cpu_controller <= J_START;
        end
        R_START : begin // Just a filler state with a standard name.
          cpu_controller <= R_READ_REGISTERS;
        end
        R_READ_REGISTERS : begin
          rs1 <= instruction[RS1_START:RS1_END];
          rs2 <= instruction[RS2_START:RS2_END];
          imm_select <= 0;
          alu_src_store <= 1; // store the value in the register
          cpu_controller <= R_ALU;
        end
        R_ALU : begin
          alu_src_store <= 0; // lock the value in the register
          if      (instruction[FUNCT3_START:FUNCT3_END] == 3'b000 & instruction[FUNCT7_START:FUNCT7_END] == 7'b0000000)
            alu_control <= ALU_ADD;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b000 & instruction[FUNCT7_START:FUNCT7_END] == 7'b1000000)
            alu_control <= ALU_SUB;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b001)
            alu_control <= ALU_SLL;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b010)
            alu_control <= ALU_SLT;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b011)
            alu_control <= ALU_SLTU;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b100)
            alu_control <= ALU_XOR;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b101 & instruction[FUNCT7_START:FUNCT7_END] == 7'b0000000)
            alu_control <= ALU_SRL;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b101 & instruction[FUNCT7_START:FUNCT7_END] == 7'b0100000)
            alu_control <= ALU_SRA;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b110)
            alu_control <= ALU_OR;
          else if (instruction[FUNCT3_START:FUNCT3_END] == 3'b111)
            alu_control <= ALU_AND;
          else
            alu_control <= ALU_INVALID;
          cpu_controller <= R_WRITE_REGISTERS;
        end

      endcase
    end
  end
end

endmodule
