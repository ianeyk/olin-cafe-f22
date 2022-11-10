`default_nettype none
`timescale 1ns/1ps
`include mux32_32

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

logic [31:0] x00; 
always_comb x00 = 32'd0; // ties x00 to ground.
register reg_0(.clk(clk), .ena(reg_0_ena), .rst(reg_0_rst), .d(wr_data), .q(word0));
register reg_1(.clk(clk), .ena(reg_1_ena), .rst(reg_1_rst), .d(wr_data), .q(word1));
register reg_2(.clk(clk), .ena(reg_2_ena), .rst(reg_2_rst), .d(wr_data), .q(word2));
register reg_3(.clk(clk), .ena(reg_3_ena), .rst(reg_3_rst), .d(wr_data), .q(word3));
register reg_4(.clk(clk), .ena(reg_4_ena), .rst(reg_4_rst), .d(wr_data), .q(word4));
register reg_5(.clk(clk), .ena(reg_5_ena), .rst(reg_5_rst), .d(wr_data), .q(word5));
register reg_6(.clk(clk), .ena(reg_6_ena), .rst(reg_6_rst), .d(wr_data), .q(word6));
register reg_7(.clk(clk), .ena(reg_7_ena), .rst(reg_7_rst), .d(wr_data), .q(word7));
register reg_8(.clk(clk), .ena(reg_8_ena), .rst(reg_8_rst), .d(wr_data), .q(word8));
register reg_9(.clk(clk), .ena(reg_9_ena), .rst(reg_9_rst), .d(wr_data), .q(word9));
register reg_10(.clk(clk), .ena(reg_10_ena), .rst(reg_10_rst), .d(wr_data), .q(word10));
register reg_11(.clk(clk), .ena(reg_11_ena), .rst(reg_11_rst), .d(wr_data), .q(word11));
register reg_12(.clk(clk), .ena(reg_12_ena), .rst(reg_12_rst), .d(wr_data), .q(word12));
register reg_13(.clk(clk), .ena(reg_13_ena), .rst(reg_13_rst), .d(wr_data), .q(word13));
register reg_14(.clk(clk), .ena(reg_14_ena), .rst(reg_14_rst), .d(wr_data), .q(word14));
register reg_15(.clk(clk), .ena(reg_15_ena), .rst(reg_15_rst), .d(wr_data), .q(word15));
register reg_16(.clk(clk), .ena(reg_16_ena), .rst(reg_16_rst), .d(wr_data), .q(word16));
register reg_17(.clk(clk), .ena(reg_17_ena), .rst(reg_17_rst), .d(wr_data), .q(word17));
register reg_18(.clk(clk), .ena(reg_18_ena), .rst(reg_18_rst), .d(wr_data), .q(word18));
register reg_19(.clk(clk), .ena(reg_19_ena), .rst(reg_19_rst), .d(wr_data), .q(word19));
register reg_20(.clk(clk), .ena(reg_20_ena), .rst(reg_20_rst), .d(wr_data), .q(word20));
register reg_21(.clk(clk), .ena(reg_21_ena), .rst(reg_21_rst), .d(wr_data), .q(word21));
register reg_22(.clk(clk), .ena(reg_22_ena), .rst(reg_22_rst), .d(wr_data), .q(word22));
register reg_23(.clk(clk), .ena(reg_23_ena), .rst(reg_23_rst), .d(wr_data), .q(word23));
register reg_24(.clk(clk), .ena(reg_24_ena), .rst(reg_24_rst), .d(wr_data), .q(word24));
register reg_25(.clk(clk), .ena(reg_25_ena), .rst(reg_25_rst), .d(wr_data), .q(word25));
register reg_26(.clk(clk), .ena(reg_26_ena), .rst(reg_26_rst), .d(wr_data), .q(word26));
register reg_27(.clk(clk), .ena(reg_27_ena), .rst(reg_27_rst), .d(wr_data), .q(word27));
register reg_28(.clk(clk), .ena(reg_28_ena), .rst(reg_28_rst), .d(wr_data), .q(word28));
register reg_29(.clk(clk), .ena(reg_29_ena), .rst(reg_29_rst), .d(wr_data), .q(word29));
register reg_30(.clk(clk), .ena(reg_30_ena), .rst(reg_30_rst), .d(wr_data), .q(word30));
register reg_31(.clk(clk), .ena(reg_31_ena), .rst(reg_31_rst), .d(wr_data), .q(word31));

logic [31:0] word0, word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13, word14, word15, word16, word17, word18, word19, word20, word21, word22, word23, word24, word25, word26, word27, word28, word29, word30, word31;
// decoder for enabling the registers for writing one at a time
always_comb decoder = wr_ena ? (32'b1 << wr_addr) : 32'b0;
mux32 read_port_0(.a({word0, word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13, word14, word15, word16, word17, word18, word19, word20, word21, word22, word23, word24, word25, word26, word27, word28, word29, word30, word31}), .s(rd_addr0), .y(rd_data0));
mux32 read_port_1(.a({word0, word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13, word14, word15, word16, word17, word18, word19, word20, word21, word22, word23, word24, word25, word26, word27, word28, word29, word30, word31}), .s(rd_addr1), .y(rd_data1));

endmodule