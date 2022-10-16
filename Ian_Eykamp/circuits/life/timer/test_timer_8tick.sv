`timescale 1ns/1ps
`default_nettype none

module test_timer_8tick;

// Clock generation:
always #10 clk = ~clk;

logic rst, clk;
wire [2:0] next_tick;

timer_8tick UUT(
  .clk(clk),
  .rst(rst),
  .next_tick(next_tick)
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
    $display("%d", next_tick);
  end
  $display("... done. Use gtkwave to see what this does!");
  $finish;
end

endmodule
