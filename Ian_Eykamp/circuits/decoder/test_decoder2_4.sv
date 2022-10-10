`timescale 1ns/1ps
`default_nettype none
module test_decoder2_4;

int errors = 0;

logic en;
logic [1:0] a;
wire [3:0] out;

decoder2_4 UUT(.a(a), .en(en), .out(out));


// Some behavioural comb. logic that computes correct values.
logic [3:0] correct_out;

always_comb begin : behavioural_solution_logic
  if (~en) begin
    correct_out = 4'b0000;
  end else begin
    correct_out = 4'b0000;
    correct_out[a] = 1;
  end
end

// You can make "tasks" in testbenches. Think of them like methods of a class, 
// they have access to the member variables.
task print_io;
  $display("%b %b | %b (%b)", en, a, out, correct_out);
  // $display("%b %b | %b %b (%b)", en, a, out[0], out[1], correct_out);
endtask

integer i;
// 2) the test cases - initial blocks are like programming, not hardware
initial begin
  $dumpfile("decoder2_4.fst");
  $dumpvars(0, UUT);
  
  $display("Checking all inputs.");
  $display("en a | out (correct out)");
  for (i = 0; i < 8; i = i + 1) begin
    a[0] = i[0];
    a[1] = i[1];
    en = i[2];
    #1 print_io();
  end

  # 1;
  if (errors !== 0) begin
    $display("---------------------------------------------------------------");
    $display("-- FAILURE                                                   --");
    $display("---------------------------------------------------------------");
    $display(" %d failures found, try again!", errors);
  end else begin
    $display("---------------------------------------------------------------");
    $display("-- SUCCESS                                                   --");
    $display("---------------------------------------------------------------");
  end
  $finish;
end

// Note: the triple === (corresponding !==) check 4-state (e.g. 0,1,x,z) values.
//       It's best practice to use these for checkers!
always @(a or en) begin
  #1;
  assert(out === correct_out) else begin
    // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
    errors = errors + 1;
  end
end

endmodule
