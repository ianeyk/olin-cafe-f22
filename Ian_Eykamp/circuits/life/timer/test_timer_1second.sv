`timescale 1ns/1ps
`default_nettype none

module test_timer_1second;

// Clock generation:
always #10 clk = ~clk;

logic rst, clk;
wire output_pulse;

timer_1second UUT(
  .clk(clk),
  .rst(rst),
  .output_pulse(output_pulse)
);

initial begin
  $dumpfile("timer_1second.fst");
  $dumpvars(0, UUT);

  clk = 0;
  rst = 1;

  $display("Running simulation...");
  @(negedge clk) rst = 0;
  repeat (100) begin
    @(posedge clk);
    $display("%d", output_pulse);
  end
  $display("... done. Use gtkwave to see what this does!");
  $finish;
end

endmodule
