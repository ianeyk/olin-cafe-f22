`default_nettype none
`timescale 1ns/1ps
`include "./hdl/mux2.sv"
`include "./hdl/mux32_32.sv"

module register_file(
  clk, //Note - intentionally does not have a reset! 
  wr_ena, wr_addr, wr_data,
  rd_addr0, rd_data0,
  rd_addr1, rd_data1
);
// Not parametrizing, these widths are defined by the RISC-V Spec!
input wire clk;

// Write channel
input wire wr_ena;
input wire [4:0] wr_addr;
input wire [31:0] wr_data;

// Two read channels
input wire [4:0] rd_addr0, rd_addr1;
output logic [31:0] rd_data0, rd_data1;

logic [31:0] decoder;

logic [31:0] x00; 
always_comb x00 = 32'd0; // ties x00 to ground.
register #(.N(32)) reg_1(.clk(clk), .ena(decoder[1]), .rst(1'b0), .d(wr_data), .q(word1));
register #(.N(32)) reg_2(.clk(clk), .ena(decoder[2]), .rst(1'b0), .d(wr_data), .q(word2));
register #(.N(32)) reg_3(.clk(clk), .ena(decoder[3]), .rst(1'b0), .d(wr_data), .q(word3));
register #(.N(32)) reg_4(.clk(clk), .ena(decoder[4]), .rst(1'b0), .d(wr_data), .q(word4));
register #(.N(32)) reg_5(.clk(clk), .ena(decoder[5]), .rst(1'b0), .d(wr_data), .q(word5));
register #(.N(32)) reg_6(.clk(clk), .ena(decoder[6]), .rst(1'b0), .d(wr_data), .q(word6));
register #(.N(32)) reg_7(.clk(clk), .ena(decoder[7]), .rst(1'b0), .d(wr_data), .q(word7));
register #(.N(32)) reg_8(.clk(clk), .ena(decoder[8]), .rst(1'b0), .d(wr_data), .q(word8));
register #(.N(32)) reg_9(.clk(clk), .ena(decoder[9]), .rst(1'b0), .d(wr_data), .q(word9));
register #(.N(32)) reg_10(.clk(clk), .ena(decoder[10]), .rst(1'b0), .d(wr_data), .q(word10));
register #(.N(32)) reg_11(.clk(clk), .ena(decoder[11]), .rst(1'b0), .d(wr_data), .q(word11));
register #(.N(32)) reg_12(.clk(clk), .ena(decoder[12]), .rst(1'b0), .d(wr_data), .q(word12));
register #(.N(32)) reg_13(.clk(clk), .ena(decoder[13]), .rst(1'b0), .d(wr_data), .q(word13));
register #(.N(32)) reg_14(.clk(clk), .ena(decoder[14]), .rst(1'b0), .d(wr_data), .q(word14));
register #(.N(32)) reg_15(.clk(clk), .ena(decoder[15]), .rst(1'b0), .d(wr_data), .q(word15));
register #(.N(32)) reg_16(.clk(clk), .ena(decoder[16]), .rst(1'b0), .d(wr_data), .q(word16));
register #(.N(32)) reg_17(.clk(clk), .ena(decoder[17]), .rst(1'b0), .d(wr_data), .q(word17));
register #(.N(32)) reg_18(.clk(clk), .ena(decoder[18]), .rst(1'b0), .d(wr_data), .q(word18));
register #(.N(32)) reg_19(.clk(clk), .ena(decoder[19]), .rst(1'b0), .d(wr_data), .q(word19));
register #(.N(32)) reg_20(.clk(clk), .ena(decoder[20]), .rst(1'b0), .d(wr_data), .q(word20));
register #(.N(32)) reg_21(.clk(clk), .ena(decoder[21]), .rst(1'b0), .d(wr_data), .q(word21));
register #(.N(32)) reg_22(.clk(clk), .ena(decoder[22]), .rst(1'b0), .d(wr_data), .q(word22));
register #(.N(32)) reg_23(.clk(clk), .ena(decoder[23]), .rst(1'b0), .d(wr_data), .q(word23));
register #(.N(32)) reg_24(.clk(clk), .ena(decoder[24]), .rst(1'b0), .d(wr_data), .q(word24));
register #(.N(32)) reg_25(.clk(clk), .ena(decoder[25]), .rst(1'b0), .d(wr_data), .q(word25));
register #(.N(32)) reg_26(.clk(clk), .ena(decoder[26]), .rst(1'b0), .d(wr_data), .q(word26));
register #(.N(32)) reg_27(.clk(clk), .ena(decoder[27]), .rst(1'b0), .d(wr_data), .q(word27));
register #(.N(32)) reg_28(.clk(clk), .ena(decoder[28]), .rst(1'b0), .d(wr_data), .q(word28));
register #(.N(32)) reg_29(.clk(clk), .ena(decoder[29]), .rst(1'b0), .d(wr_data), .q(word29));
register #(.N(32)) reg_30(.clk(clk), .ena(decoder[30]), .rst(1'b0), .d(wr_data), .q(word30));
register #(.N(32)) reg_31(.clk(clk), .ena(decoder[31]), .rst(1'b0), .d(wr_data), .q(word31));

logic [31:0] word0, word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13, word14, word15, word16, word17, word18, word19, word20, word21, word22, word23, word24, word25, word26, word27, word28, word29, word30, word31;
// decoder for enabling the registers for writing one at a time
always_comb decoder = wr_ena ? (32'b1 << wr_addr) : 32'b0;
mux32_32 read_port_0(.a({word31, word30, word29, word28, word27, word26, word25, word24, word23, word22, word21, word20, word19, word18, word17, word16, word15, word14, word13, word12, word11, word10, word9, word8, word7, word6, word5, word4, word3, word2, word1, word0}), .s(rd_addr0), .y(rd_data0));
mux32_32 read_port_1(.a({word31, word30, word29, word28, word27, word26, word25, word24, word23, word22, word21, word20, word19, word18, word17, word16, word15, word14, word13, word12, word11, word10, word9, word8, word7, word6, word5, word4, word3, word2, word1, word0}), .s(rd_addr1), .y(rd_data1));

always_comb word0 = 32'd0;

endmodule