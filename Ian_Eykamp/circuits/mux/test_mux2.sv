`timescale 1ns/1ps
`default_nettype none
module test_mux2;

int errors = 0;

logic a, b, s;
wire y;

mux2 UUT(.a(a), .b(b), .s(s), .y(y));

/*
*/


// Some behavioural comb. logic that computes correct values.
logic correct_out;

always_comb begin : behavioural_solution_logic
  correct_out = s ? b : a;
end

// You can make "tasks" in testbenches. Think of them like methods of a class, 
// they have access to the member variables.
task print_io;
  $display("%b %b %b | %b (%b)", s, a, b, y, correct_out);
endtask

integer i;
// 2) the test cases - initial blocks are like programming, not hardware
initial begin
  $dumpfile("mux2.fst");
  $dumpvars(0, UUT);
  
  $display("Checking all inputs.");
  $display("s a b | y (correct out)");
  for (i = 0; i < 8; i = i + 1) begin
    b = i[0];
    a = i[1];
    s = i[2];
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
always @(a or b or s) begin
  #1;
  assert(y === correct_out) else begin
    // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
    errors = errors + 1;
  end
end

endmodule
