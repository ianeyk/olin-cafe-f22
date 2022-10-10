`timescale 1ns/1ps
`default_nettype none
module test_adder3;

int errors = 0;

logic [2:0] a, b;
logic cin;
wire [2:0] s;
wire cout;

adder3 UUT(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

/*
*/


// Some behavioural comb. logic that computes correct values.
logic [2:0] correct_s;
logic correct_cout;
logic [3:0] extra_bit_sum;

always_comb begin : behavioural_solution_logic
  extra_bit_sum = a + b + cin;
  correct_s = extra_bit_sum[2:0];
  correct_cout = extra_bit_sum[3];
end

// You can make "tasks" in testbenches. Think of them like methods of a class, 
// they have access to the member variables.
task print_io;
  $display("%b %b  %b  | %b %b (%b %b)", a, b, cin, cout, s, correct_cout, correct_s);
  // $display("%b %b | %b %b (%b)", en, a, out[0], out[1], correct_out);
endtask

integer i;
// 2) the test cases - initial blocks are like programming, not hardware
initial begin
  $dumpfile("test_adder3.fst");
  $dumpvars(0, UUT);
  
  $display("Checking all inputs.");
  $display("a  b  cin | c s  (correct_c correct_s)");
  for (i = 0; i < (2**7); i = i + 1) begin
    a = i[5:3];
    b = i[2:0];
    cin = i[6];
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
always @(a or b or cin) begin
  #1;
  assert((s === correct_s) & (cout === correct_cout)) else begin
    // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
    errors = errors + 1;
  end
end

endmodule
