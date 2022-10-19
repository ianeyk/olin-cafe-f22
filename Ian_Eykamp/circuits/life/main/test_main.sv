`timescale 1ns/1ps
`default_nettype none
// `include "./main/main.sv"

module test_main;

// Clock generation:
always #10 clk = ~clk;

logic rst, clk;
wire [7:0] rows_out, columns_out;

logic [1:0] buttons;
always_comb buttons = {rst, rst};

main UUT(.clk(clk), .buttons(buttons), .rows_out(rows_out), .columns_out(columns_out));

time i;

initial begin
  $dumpfile("./main/test_main.fst");
  $dumpvars(0, UUT);

  clk = 0;
  rst = 1;
  i = 0;

  $display("Running simulation...");
  #5 @(negedge clk) rst = 0;
  repeat (320) begin
    @(posedge clk);
    $display("%b  |  %b", columns_out, rows_out);
    
    // add breaks between grids
    i = i + 1;
    if (i % 8 == 0) begin
      $display("");
    end

  end
  $display("... done. Use gtkwave to see what this does!");
  $finish;
end

endmodule
