`timescale 1ns/1ps
`default_nettype none

`include "alu_types.sv"
`include "rv32i_defines.sv"
`include "instruction_bit_lookup_tables.sv"
`include "adder32.sv"
`include "mux2_32.sv"
`include "mux3_32.sv"
`include "register.sv"
`include "register_file.sv"
`include "alu_behavioural.sv"
`include "immediate_extender.sv"
`include "decoder_5_to_32.sv"

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

always_comb case(cpu_controller)
  IDLE : PC_ena = 1;
  default : PC_ena = 0;
endcase

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

always_comb begin
  rs1 = instruction[`RS1_START:`RS1_END];
  rs2 = instruction[`RS2_START:`RS2_END];
  rd  = instruction[`RD_START:`RD_END];
end

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

logic zzz_firework;
always_comb case(cpu_controller)
  LOAD_INSTRUCTION : instruction_store_ena = 1;
  DONE_LOADING_INSTRUCTION : instruction_store_ena = 1;
  default : instruction_store_ena = 0;
endcase

logic memory_read_ena;
logic [31:0] memory_value;
register #(.N(32)) memory_store(.clk(clk), .ena(memory_read_ena), .rst(rst), .d(mem_rd_data), .q(memory_value));

logic rs2_read_ena;
logic [31:0] rs2_value;
register #(.N(32)) rs2_store(.clk(clk), .ena(rs2_read_ena), .rst(rst), .d(reg_data2), .q(rs2_value));

logic alu_src_store_ena;
register #(.N(32)) alu_src_a_store(.clk(clk), .ena(alu_src_store_ena), .rst(rst), .d(reg_data1), .q(alu_src_a));
register #(.N(32)) alu_src_b_store(.clk(clk), .ena(alu_src_store_ena), .rst(rst), .d(alu_src_b_mux), .q(alu_src_b));

logic alu_result_store_ena;
wire [31:0] alu_result;
register #(.N(32)) alu_result_store(.clk(clk), .ena(alu_result_store_ena), .rst(rst), .d(alu_result_temp), .q(alu_result));

wire [31:0] immediate_extended;
logic [19:0] immediate;
logic [1:0] imm_control;
immediate_extender imm_extender(.immediate(immediate), .control(imm_control), .out(immediate_extended));

logic [1:0] output_select;
logic imm_select;
wire [31:0] alu_src_b_mux;
mux2_32 imm_enabler(.a({immediate_extended, reg_data2}), .s(imm_select), .y(alu_src_b_mux));
mux3_32 output_switcher(.a({PC, memory_value, alu_result}), .s(output_select), .y(rfile_wr_data)); // 3, 2, 1 [2:0];

logic [1:0] trash_can;
adder32 PC_incrementer(.a(PC), .b(32'd4), .cin(1'b0), .s(PC_next), .cout(trash_can[0]));

instruction_t instruction_type;
op_code_lookup op_code_lookup_table(.instruction(instruction), .instruction_type(instruction_type));

alu_control_t r_type_alu_operation;
alu_control_t i_type_alu_operation;
r_type_alu_op_lookup r_type_alu_op_lookup_table(.instruction(instruction), .alu_operation(r_type_alu_operation));
i_type_alu_op_lookup i_type_alu_op_lookup_table(.instruction(instruction), .alu_operation(i_type_alu_operation));

enum logic [5:0] { IDLE, LOAD_INSTRUCTION, DONE_LOADING_INSTRUCTION,
  R_START, R_READ_REGISTERS, R_ALU, R_WRITE_REGISTERS, R_DONE, 
  I_START, I_READ_REGISTERS, I_ALU, I_WRITE_REGISTERS, I_DONE, 
  L_START, L_READ_REGISTERS, L_ALU, L_READ_MEMORY, L_WRITE_REGISTERS, L_DONE, 
  S_START, S_READ_REGISTERS, S_ALU, S_WRITE_MEMORY, S_DONE, 
  B_START, U_START, J_START, ERROR} cpu_controller;

always_ff @(posedge clk) begin : cpu_controller_fsm
  if(rst) begin
    cpu_controller <= IDLE;
    reg_write <= 0;
    imm_control <= 0;
    imm_select <= 0;
    immediate <= 20'b0;
    // rs1 <= 0;
    // rs2 <= 0;
    // rd <= 0;
    // instruction_store_ena <= 0;
    rs2_read_ena <= 0;
    alu_src_store_ena <= 0;
    alu_result_store_ena <= 0;
    output_select <= 0;
    memory_read_ena <= 0;
    // PC_ena <= 0;
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
          // rs1 <= 0;
          // rs2 <= 0;
          // rd <= 0;
          // instruction_store_ena <= 0;
          rs2_read_ena <= 0;
          alu_src_store_ena <= 0;
          alu_result_store_ena <= 0;
          output_select <= 0;
          memory_read_ena <= 0;
          // PC_ena <= 1;
          mem_addr <= 0;
          mem_wr_ena <= 0;
          mem_wr_data <= 0;
          cpu_controller <= LOAD_INSTRUCTION;
        end
        LOAD_INSTRUCTION : begin
          // instruction_store_ena <= 1;
          mem_addr <= PC;
          // PC_ena <= 0;
          cpu_controller <= DONE_LOADING_INSTRUCTION;
        end
        DONE_LOADING_INSTRUCTION : begin // save instruction in register, so memory can be used for other things
          // instruction_store_ena <= 0;
          case(instruction_type)
            R_TYPE : cpu_controller <= R_START;
            I_TYPE : cpu_controller <= I_START;
            L_TYPE : cpu_controller <= L_START;
            S_TYPE : cpu_controller <= S_START;
            B_TYPE : cpu_controller <= B_START;
            U_TYPE : cpu_controller <= U_START;
            J_TYPE : cpu_controller <= J_START;
            default: cpu_controller <= ERROR;
          endcase
        end

        //// R-TYPE FSM

        R_START : begin // Just a filler state with a standard name.
          cpu_controller <= R_READ_REGISTERS;
        end
        R_READ_REGISTERS : begin
          // rs1 <= instruction[`RS1_START:`RS1_END];
          // rs2 <= instruction[`RS2_START:`RS2_END];
          imm_select <= 0;
          alu_src_store_ena <= 1; // store the value in the register
          cpu_controller <= R_ALU;
        end
        R_ALU : begin
          alu_src_store_ena <= 0; // lock the value in the register
          alu_result_store_ena <= 1;
          alu_control <= r_type_alu_operation;
          cpu_controller <= R_WRITE_REGISTERS;
        end
        R_WRITE_REGISTERS : begin
          alu_result_store_ena <= 0; // lock the ALU result
          reg_write <= 1;
          rd <= instruction[`RD_START:`RD_END];
          output_select <= 0; // from ALU
          cpu_controller <= R_DONE;
        end
        R_DONE : begin
          reg_write <= 0;
          cpu_controller <= IDLE;
        end

        //// I-TYPE FSM

        I_START : begin
          cpu_controller <= I_READ_REGISTERS;
        end
        I_READ_REGISTERS : begin
          // rs1 <= instruction[`RS1_START:`RS1_END];
          // rs2 <= instruction[`RS2_START:`RS2_END]; // optional
          immediate <= instruction[`I_TYPE_IMM_START:`I_TYPE_IMM_END];
          imm_control <= 0; // I-type
          imm_select <= 1;
          alu_src_store_ena <= 1; // store the value in the register
          cpu_controller <= I_ALU;
        end
        I_ALU : begin
          alu_src_store_ena <= 0; // lock the value in the register
          alu_result_store_ena <= 1;
          alu_control <= i_type_alu_operation;
          cpu_controller <= I_WRITE_REGISTERS;
        end
        I_WRITE_REGISTERS : begin
          alu_result_store_ena <= 0; // lock the ALU result
          reg_write <= 1;
          rd <= instruction[`RD_START:`RD_END];
          output_select <= 0; // from ALU
          cpu_controller <= I_DONE;
        end
        I_DONE : begin
          reg_write <= 0;
          cpu_controller <= IDLE;
        end

        //// L-TYPE FSM

        L_START : begin
          cpu_controller <= L_READ_REGISTERS;
        end
        L_READ_REGISTERS : begin
          // rs1 <= instruction[`RS1_START:`RS1_END];
          // rs2 <= instruction[`RS2_START:`RS2_END]; // optional
          immediate <= instruction[`I_TYPE_IMM_START:`I_TYPE_IMM_END]; // same bit positions as I-type
          imm_control <= 0; // L-type
          imm_select <= 1; // yes, use the immediate bits
          alu_src_store_ena <= 1; // store the value in the register
          cpu_controller <= L_ALU;
        end
        L_ALU : begin
          alu_src_store_ena <= 0; // lock the value in the register
          alu_result_store_ena <= 1;
          alu_control <= ALU_ADD;
          cpu_controller <= L_WRITE_REGISTERS;
        end
        L_READ_MEMORY : begin
          alu_result_store_ena <= 0; // lock the ALU result
          memory_read_ena <= 1; // store the value in the other memory register
          mem_addr <= alu_result;
          mem_wr_ena <= 0; // just reading
        end
        L_WRITE_REGISTERS : begin
          memory_read_ena <= 0; // lock the memory register
          reg_write <= 1;
          rd <= instruction[`RD_START:`RD_END];
          output_select <= 1; // from memory address
          cpu_controller <= L_DONE;
        end
        L_DONE : begin
          reg_write <= 0;
          cpu_controller <= IDLE;
        end

        //// S-TYPE FSM

        S_START : begin
          cpu_controller <= S_READ_REGISTERS;
        end
        S_READ_REGISTERS : begin
          // rs1 <= instruction[`RS1_START:`RS1_END];
          // rs2 <= instruction[`RS2_START:`RS2_END];
          immediate <= {instruction[`S_TYPE_IMM_1_START:`S_TYPE_IMM_1_END], instruction[`S_TYPE_IMM_2_START:`S_TYPE_IMM_2_END]};
          imm_control <= 2; // S-type
          imm_select <= 1; // yes, use the immediate bits
          rs2_read_ena <= 1; // store the value from the rs2 register
          alu_src_store_ena <= 1; // store the value in the register
          cpu_controller <= S_ALU;
        end
        S_ALU : begin
          rs2_read_ena <= 0; // lock the value from the rs2 resister
          alu_src_store_ena <= 0; // lock the value in the register
          alu_result_store_ena <= 1;
          alu_control <= ALU_ADD;
          cpu_controller <= S_WRITE_MEMORY;
        end
        S_WRITE_MEMORY : begin
          alu_result_store_ena <= 0; // lock the ALU result
          mem_addr <= alu_result;
          mem_wr_ena <= 1; // store the value
          mem_wr_data <= rs2_value;
          cpu_controller <= S_DONE;
        end
        S_DONE : begin
          mem_wr_ena <= 0; // stop writing the value to memory
          cpu_controller <= IDLE;
        end
      endcase
    end
  end
end

endmodule
