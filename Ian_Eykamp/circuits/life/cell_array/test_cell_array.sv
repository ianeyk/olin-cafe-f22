`timescale 1ns/1ps
`default_nettype none
module test_cell_array;

int errors = 0;

logic [7:0] this_row, top_row, bottom_row;
wire [7:0] next_state;

cell_array UUT(.this_row(this_row), .top_row(top_row), .bottom_row(bottom_row), .next_state(next_state));

// Some behavioural comb. logic that computes correct values.
logic [7:0] correct_out;
logic [3:0] num_neighbors;
logic [10*3-1:0] whole_array;
integer loc;

always_comb begin : behavioural_solution_logic
  whole_array[0] = 0;
  whole_array[8:1] = top_row;
  whole_array[10:9] = 0;
  whole_array[18:11] = this_row;
  whole_array[20:19] = 0;
  whole_array[28:21] = bottom_row;
  whole_array[29] = 0;


  for (loc = 0; loc < 8; loc = loc + 1) begin
      num_neighbors = whole_array[loc] + whole_array[loc + 1] + whole_array[loc + 2] + whole_array[loc + 10] + whole_array[loc + 10 + 2] + whole_array[loc + 20] + whole_array[loc + 20 + 1] + whole_array[loc + 20 + 2];
      if (this_row[loc]) begin
          if (num_neighbors == 2 | num_neighbors == 3) begin
              correct_out[loc] = 1;
          end else begin
              correct_out[loc] = 0;
          end
      end else begin
          if (num_neighbors == 3) begin
              correct_out[loc] = 1;
          end else begin
              correct_out[loc] = 0;
          end
      end
  end

end

// You can make "tasks" in testbenches. Think of them like methods of a class, 
// they have access to the member variables.
task print_io;
  $display("%b\n%b |  %b\n%b | (%b)\n\n", top_row, this_row, next_state, bottom_row, correct_out);
  // $display("%b %b | %b %b (%b)", en, a, out[0], out[1], correct_out);
endtask

integer i;
// 2) the test cases - initial blocks are like programming, not hardware
initial begin
  $dumpfile("test_cell_array.fst");
  $dumpvars(0, UUT);
  
  $display("Checking all inputs.");
  $display("top_row   \nthis_row   |  next_state\nbottom_row | (correct_out)");
  for (i = 0; i < (2**6); i = i + 1) begin
    this_row = $random;
    top_row = $random;
    bottom_row = $random;

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
always @(this_row, top_row, bottom_row) begin
  #1;
  assert(next_state === correct_out) else begin
    // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
    errors = errors + 1;
  end
end

endmodule
