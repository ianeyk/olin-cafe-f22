`timescale 1ns/1ps
`default_nettype none
module test_cell8;

int errors = 0;

logic current_state;
logic [7:0] neighbors;
wire next_state;

cell8 UUT(current_state, neighbors, next_state);

/*
*/

// function [3:0] n_neighbors (input [7:0] n);
//     begin
//         integer i;
//         integer count;
//         count = 0;
//         for (i = 0; i < 8; i = i + 1) begin
//           if (n[i] == 1'b1) begin
//             count = count + 1;
//           end
//         end
//         n_neighbors = count;
//     end
// endfunction


// Some behavioural comb. logic that computes correct values.
logic correct_out;
logic [3:0] num_neighbors;

always_comb begin : behavioural_solution_logic
  num_neighbors = neighbors[0] + neighbors[1] + neighbors[2] + neighbors[3] + neighbors[4] + neighbors[5] + neighbors[6] + neighbors[7];
  correct_out = (num_neighbors == 3) | (current_state & num_neighbors == 2);
end

// You can make "tasks" in testbenches. Think of them like methods of a class, 
// they have access to the member variables.
task print_io;
  $display("%b %b | %b (%b)", current_state, neighbors, next_state, correct_out);
  // $display("%b %b | %b %b (%b)", en, a, out[0], out[1], correct_out);
endtask

integer i;
// 2) the test cases - initial blocks are like programming, not hardware
initial begin
  $dumpfile("test_cell8.fst");
  $dumpvars(0, UUT);
  
  $display("Checking all inputs.");
  $display("alive neigbbors | next_state (correct_out)");
  for (i = 0; i < (2**9); i = i + 1) begin
    neighbors = i[7:0];
    current_state = i[8];

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
always @(current_state, neighbors) begin
  #1;
  assert(next_state === correct_out) else begin
    // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
    errors = errors + 1;
  end
end

endmodule
