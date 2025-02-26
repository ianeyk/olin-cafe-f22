`timescale 1ns/1ps
`default_nettype none

module test_mux4;

    int errors = 0;

    logic [3:0] a;
    logic [1:0] s;
    wire y;

    mux4 UUT(.a(a), .s(s), .y(y));


    // Some behavioural comb. logic that computes correct values.
    logic correct_out;

    always_comb begin : behavioural_solution_logic
        if (s < 4) begin
            correct_out = a[s];
        end else begin
            correct_out = 2`b00;//1`bx;
        end
    end

    // You can make "tasks" in testbenches. Think of them like methods of a class, 
    // they have access to the member variables.
    task print_io;
        $display("%b %b | %b (%b)", s, a, y, correct_out);
    endtask

    time i; // 64-bit integer, not 32
    // 2) the test cases - initial blocks are like programming, not hardware
    initial begin
    $dumpfile("././generated_muxes/mux4.fst");
    $dumpvars(0, UUT);
    
    $display("Checking all inputs.");
$display("s  a    | y (correct out)");
    for (i = 0; i < 64; i = i + 1) begin
        a = i[3:0];
        s = i[6:4];
        #1 print_io();
    end
    
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
    always @(a or s) begin
        assert(y === correct_out) else begin
            // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
            errors = errors + 1;
        end
    end

endmodule
