`timescale 1ns/1ps
`default_nettype none

module test_main;

// Clock generation:
always #10 clk = ~clk;

logic rst, clk;
wire [7:0] leds_out;

main UUT(
  .clk(clk),
  .rst(rst),
  .leds_out(leds_out)
);

initial begin
  $dumpfile("./main/test_main.fst");
  $dumpvars(0, UUT);

  clk = 0;
  rst = 1;

  $display("Running simulation...");
  @(negedge clk) rst = 0;
  repeat (100) begin
    @(posedge clk);
    $display("%b", leds_out);
  end
  $display("... done. Use gtkwave to see what this does!");
  $finish;
end

endmodule
