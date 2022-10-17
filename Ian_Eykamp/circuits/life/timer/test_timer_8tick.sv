`timescale 1ns/1ps
`default_nettype none

module test_timer_8tick;

// Clock generation:
always #10 clk = ~clk;

logic rst, clk;
wire [2:0] tick_out;

timer_8tick UUT(
  .clk(clk),
  .rst(rst),
  .tick_out(tick_out)
);

initial begin
  $dumpfile("timer_8tick.fst");
  $dumpvars(0, UUT);

  clk = 0;
  rst = 1;

  $display("Running simulation...");
  @(negedge clk) rst = 0;
  repeat (64) begin
    @(posedge clk);
    $display("%d", tick_out);
  end
  $display("... done. Use gtkwave to see what this does!");
  $finish;
end

endmodule
