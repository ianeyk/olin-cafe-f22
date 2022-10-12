import math

class MuxTestGenerator:
    def __init__(self, n: int = 4, mux_dir: str = "./Ian_Eykamp/circuits/mux_n/generated_muxes") -> None:
        self.n = n
        self.n_bits = math.ceil(math.log2(n)) # number of bits in the select bus rounded up to the nearest whole bit
        self.n_2 = 2 ** self.n_bits # rounds n up to the nearest multiple of two
        self.n_half = self.n_2 / 2 # number of bits in each sub-mux

        self.mux_dir = mux_dir
        
        sv = self.generate_sv()
        # print(sv)
        self.write_file(sv)
    
    def write_file(self, txt: str) -> None:
        f = open(f"{self.mux_dir}/test_mux{self.n}.sv", "w")
        f.write(txt)
        f.close()
    
    def generate_sv(self) -> str:
        n = self.n
        n_bits = self.n_bits
        n_2 = self.n_2
        n_half = self.n_half
        

        file_header = """`timescale 1ns/1ps
`default_nettype none
"""

        module_header = f"""
module test_mux{n};

    int errors = 0;

    logic [{n - 1}:0] a;
    logic [{n_bits - 1}:0] s;
    wire y;

    mux{n} UUT(.a(a), .s(s), .y(y));

"""

        module_body = f"""
    // Some behavioural comb. logic that computes correct values.
    logic correct_out;

    always_comb begin : behavioural_solution_logic
        if (s < {n}) begin
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

    time i;
    // 2) the test cases - initial blocks are like programming, not hardware
    initial begin
    $dumpfile("./{self.mux_dir}/mux{n}.fst");
    $dumpvars(0, UUT);
    
    $display("Checking all inputs.");
{self.make_test_loop()}
    """

        module_footer = r"""
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
"""

        return file_header + module_header + module_body + module_footer
    
    def make_test_loop(self):
        n = self.n
        n_bits = self.n_bits
        n_2 = self.n_2
        n_half = self.n_half
        
        sample_size = 10
        
        # for fewer than 10-bit numbers, exhaustively check all inputs
        if (n_2 + n_bits) <= sample_size:
            body = f"""$display("s{' ' * n_bits}a{' ' * (n_2 - 1)} | y (correct out)");
    for (i = 0; i < {2 ** (n_2 + n_bits)}; i = i + 1) begin
        a = i[{n_2 - 1}:0];
        s = i[{n_2 + n_bits}:{n_2}];
        #1 print_io();
    end"""
        
        # for more than 10-bit numbers, just randomly choose 2^10 inputs to test
        else: 
            body = f"""$display("s{' ' * n_bits}a{' ' * (n_2 - 1)} | y (correct out)");
    for (i = 0; i < {2 ** sample_size}; i = i + 1) begin
        a = $random;
        s = $random;
        #1 print_io();
    end"""
        
        return body