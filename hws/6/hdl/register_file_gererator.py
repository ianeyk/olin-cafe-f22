class RegisterFileGenerator():
     
    def __init__(self) -> None:
        self.n = 32
        file = self.make_body()
        self.write_file(file)

    def write_file(self, txt) -> None:
        f = open("./hws/6/hdl/register_file.sv", "w")
        f.write(txt)
        f.close()

    def make_decoder(self):
        decoder = """
// decoder for enabling the registers for writing one at a time
always_comb decoder = wr_ena ? (32'b1 << wr_addr) : 32'b0;
"""
        return decoder

    def make_registers(self):
        output = ""
        for i in range(1, self.n):
            output += f"register #(.N(32)) reg_{i}(.clk(clk), .ena(decoder[{i}]), .rst(1'b0), .d(wr_data), .q(word{i}));\n"
        return output

    def make_words(self):
        output = "logic [31:0] word0"
        for i in range(1, self.n):
            output += f", word{i}"
        output += ";"
        return output
    
    def make_read_ports(self, port_id):
        output = f"""mux32_32 read_port_{port_id}(.a({{"""
        for i in range(self.n - 1, 1 - 1, -1):
            output += f"word{i}, "
        output += f"word0}}), .s(rd_addr{port_id}), .y(rd_data{port_id}));\n"
        # output += f"always_comb word31 = {{32{{1'b0}}}};"
        return output

    def make_body(self):
        file_header = f"""`default_nettype none
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
"""
        registers = self.make_registers()
        words = self.make_words()
        decoder = self.make_decoder()
        read_port_0 = self.make_read_ports(0)
        read_port_1 = self.make_read_ports(1)
        
        footer = """
always_comb word0 = 32'd0;

endmodule"""
        return file_header + registers + "\n" + words + decoder + read_port_0 + read_port_1 + footer

RegisterFile = RegisterFileGenerator()