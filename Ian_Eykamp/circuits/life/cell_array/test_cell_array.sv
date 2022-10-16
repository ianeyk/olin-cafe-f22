`timescale 1ns/1ps
`default_nettype none
module test_cell_array;

int errors = 0;

logic [63:0] cells_in;
wire [63:0] cells_out;

cell_array UUT(.cells_in, .cells_out);

// Some behavioural comb. logic that computes correct values.
logic [63:0] correct_out;
logic [3:0] num_neighbors;
logic [10*10-1:0] whole_array;
integer row;
integer col;

always_comb begin : behavioural_solution_logic

whole_array[9:0] = 0;

whole_array[10] = 0;
whole_array[18:11] = cells_in[7:0];
whole_array[19] = 0;

whole_array[20] = 0;
whole_array[28:21] = cells_in[15:8];
whole_array[29] = 0;

whole_array[30] = 0;
whole_array[38:31] = cells_in[23:16];
whole_array[39] = 0;

whole_array[40] = 0;
whole_array[48:41] = cells_in[31:24];
whole_array[49] = 0;

whole_array[50] = 0;
whole_array[58:51] = cells_in[39:32];
whole_array[59] = 0;

whole_array[60] = 0;
whole_array[68:61] = cells_in[47:40];
whole_array[69] = 0;

whole_array[70] = 0;
whole_array[78:71] = cells_in[55:48];
whole_array[79] = 0;

whole_array[80] = 0;
whole_array[88:81] = cells_in[63:56];
whole_array[89] = 0;

whole_array[99:90] = 0;


  for (row = 0; row < 8; row = row + 1) begin
    for (col = 0; col < 8; col = col + 1) begin
      num_neighbors = whole_array[10 * row + col] + whole_array[10 * row + col + 1] + whole_array[10 * row + col + 2] + whole_array[10 * row + col + 10] + whole_array[10 * row + col + 10 + 2] + whole_array[10 * row + col + 20] + whole_array[10 * row + col + 20 + 1] + whole_array[10 * row + col + 20 + 2];
      if (cells_in[row * 8 + col]) begin
          if (num_neighbors == 2 | num_neighbors == 3) begin
              correct_out[row * 8 + col] = 1;
          end else begin
              correct_out[row * 8 + col] = 0;
          end
      end else begin
          if (num_neighbors == 3) begin
              correct_out[row * 8 + col] = 1;
          end else begin
              correct_out[row * 8 + col] = 0;
          end
      end
    end
  end

end

// You can make "tasks" in testbenches. Think of them like methods of a class, 
// they have access to the member variables.
task print_io;
  $display("%b  |  %b  |  (%b)\n%b  |  %b  |  (%b)\n%b  |  %b  |  (%b)\n%b  |  %b  |  (%b)\n%b  |  %b  |  (%b)\n%b  |  %b  |  (%b)\n%b  |  %b  |  (%b)\n%b  |  %b  |  (%b)\n", cells_in[7:0], cells_out[7:0], correct_out[7:0], cells_in[15:8], cells_out[15:8],correct_out[15:8], cells_in[23:16], cells_out[23:16], correct_out[23:16], cells_in[31:24], cells_out[31:24], correct_out[31:24], cells_in[39:32], cells_out[39:32], correct_out[39:32], cells_in[47:40], cells_out[47:40], correct_out[47:40], cells_in[55:48], cells_out[55:48], correct_out[55:48], cells_in[63:56], cells_out[63:56], correct_out[63:56]);
  // $display("%b %b | %b %b (%b)", en, a, out[0], out[1], correct_out);
endtask

integer i;
// 2) the test cases - initial blocks are like programming, not hardware
initial begin
  $dumpfile("test_cell_array.fst");
  $dumpvars(0, UUT);
  
  $display("Checking all inputs.");
  $display("cells_in  |  cells_out |  (correct_out)");
  for (i = 0; i < (2**6); i = i + 1) begin
    cells_in[31:0] = $random;
    cells_in[63:32] = $random;

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
always @(cells_in) begin
  #1;
  assert(cells_out === correct_out) else begin
    // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
    errors = errors + 1;
  end
end

endmodule
