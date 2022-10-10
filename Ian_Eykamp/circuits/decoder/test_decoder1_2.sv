`timescale 1ns/1ps
`default_nettype none
module test_decoder1_2;

int errors = 0;

logic a, en;
wire [1:0] out;

decoder1_2 UUT(.a(a), .en(en), .out(out));

/*
*/


// Some behavioural comb. logic that computes correct values.
logic [1:0] correct_out;

always_comb begin : behavioural_solution_logic
  if (~en) begin
    correct_out = 2'b00;
  end else begin
    correct_out = a ? 2'b10 : 2'b01;
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
  $dumpfile("decoder1_2.fst");
  $dumpvars(0, UUT);
  
  $display("Checking all inputs.");
  $display("en a | out0 out1 (correct out)");
  for (i = 0; i < 4; i = i + 1) begin
    a = i[0];
    en = i[1];
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
