`timescale 1ns/1ps
`default_nettype none
module test_sum;

int errors = 0;

logic [7:0] a;
wire [3:0] out;

sum8 UUT(.a(a), .out(out));

/*
*/


// Some behavioural comb. logic that computes correct values.
logic [3:0] correct_out;

always_comb begin : behavioural_solution_logic
  correct_out[3:0] = a[0] + a[1] + a[2] + a[3] + a[4] + a[5] + a[6] + a[7];
end

// You can make "tasks" in testbenches. Think of them like methods of a class, 
// they have access to the member variables.
task print_io;
  $display("%b | %b (%b)", a, out, correct_out);
  // $display("%b %b | %b %b (%b)", en, a, out[0], out[1], correct_out);
endtask

integer i;
// 2) the test cases - initial blocks are like programming, not hardware
initial begin
  $dumpfile("test_sum8.fst");
  $dumpvars(0, UUT);
  
  $display("Checking all inputs.");
  $display("a      | out  (correct_out)");
  for (i = 0; i < (2**8); i = i + 1) begin
    a = i;
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
always @(a) begin
  #1;
  assert(out === correct_out) else begin
    // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
    errors = errors + 1;
  end
end

endmodule
