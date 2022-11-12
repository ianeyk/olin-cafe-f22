`timescale 1ns/1ps
`default_nettype none
`include "./generated_muxes/mux16_32.sv"

module test_mux16_32;

    int errors = 0;

    logic [511:0] a;
    logic [3:0] s;
    wire [31:0] y;

    mux16_32 UUT(.a(a), .s(s), .y(y));


    // Some behavioural comb. logic that computes correct values.
    logic [31:0] correct_out;

    always_comb begin : behavioural_solution_logic
        if (s < 16) begin
        case(s)
            0: correct_out = a[31:0];
            1: correct_out = a[63:32];
            2: correct_out = a[95:64];
            3: correct_out = a[127:96];
            4: correct_out = a[159:128];
            5: correct_out = a[191:160];
            6: correct_out = a[223:192];
            7: correct_out = a[255:224];
            8: correct_out = a[287:256];
            9: correct_out = a[319:288];
            10: correct_out = a[351:320];
            11: correct_out = a[383:352];
            12: correct_out = a[415:384];
            13: correct_out = a[447:416];
            14: correct_out = a[479:448];
            15: correct_out = a[511:480];
        endcase
            // correct_out = a[{(s + 1) * 32 - 1}-:{s * 32}];
        end else begin
            correct_out = {32{1'b0}};
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
    $dumpfile("././generated_muxes/mux16_32.fst");
    $dumpvars(0, UUT);
    
    $display("Checking all inputs.");
$display("s    a                | y (correct out)");
    for (i = 0; i < 1024; i = i + 1) begin
        a[31:0] = $random;
        a[63:31] = $random;
        a[95:63] = $random;
        a[127:95] = $random;
        a[159:127] = $random;
        a[191:159] = $random;
        a[223:191] = $random;
        a[255:223] = $random;
        a[287:255] = $random;
        a[319:287] = $random;
        a[351:319] = $random;
        a[383:351] = $random;
        a[415:383] = $random;
        a[447:415] = $random;
        a[479:447] = $random;
        a[511:479] = $random;

        s[3:0] = $random;

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
