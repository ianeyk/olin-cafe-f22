# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -g2012 -Wall -y./hdl -y./tests -Y.sv -I./hdl
VVP=vvp
VVP_POST=-fst
# VIVADO=vivado -mode batch -source # Not used in this demo.

#target : # dependencies

test_adder1: test_adder1.sv adder1.sv
	${IVERILOG} $^ -o test_adder1.bin && ${VVP} test_adder1.bin ${VVP_POST}

test_adder2: test_adder2.sv adder2.sv
	${IVERILOG} $^ -o test_adder2.bin && ${VVP} test_adder2.bin ${VVP_POST}

test_adder3: test_adder3.sv adder3.sv
	${IVERILOG} $^ -o test_adder3.bin && ${VVP} test_adder3.bin ${VVP_POST}

test_adder4: test_adder4.sv adder4.sv
	${IVERILOG} $^ -o test_adder4.bin && ${VVP} test_adder4.bin ${VVP_POST}

test_adder_n: test_adder_n.sv adder_n.sv
	${IVERILOG} $^ -o test_adder_n.bin && ${VVP} test_adder_n.bin ${VVP_POST}

waves_mux:
	gtkwave mux.fst

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd *.fst vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml
	rm -rf .Xil
	rm -rf __pycache__
	rm asm/*.memh

# Call this to generate your submission zip file.
submission:
	zip submission.zip Makefile *.sv README.md docs/* *.tcl *.xdc *.pdf
