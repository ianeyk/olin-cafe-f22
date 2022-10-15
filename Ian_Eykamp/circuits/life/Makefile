# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -g2012 -Wall -y./hdl -y./tests -Y.sv -I./hdl
VVP=vvp
VVP_POST=-fst
# VIVADO=vivado -mode batch -source # Not used in this demo.

#target : # dependencies

test_comparator2_3: naive_comparator/test_comparator2_3.sv naive_comparator/comparator2_3.sv
	${IVERILOG} $^ -o naive_comparator/test_comparator2_3.bin && ${VVP} naive_comparator/test_comparator2_3.bin ${VVP_POST}

test_comparator3: naive_comparator/test_comparator3.sv naive_comparator/comparator3.sv
	${IVERILOG} $^ -o naive_comparator/test_comparator3.bin && ${VVP} naive_comparator/test_comparator3.bin ${VVP_POST}

test_sum8: sum/test_sum8.sv sum/sum8.sv
	${IVERILOG} $^ -o sum/test_sum8.bin && ${VVP} sum/test_sum8.bin ${VVP_POST}

test_cell8: cell/test_cell8.sv cell/cell8.sv
	${IVERILOG} $^ -o cell/test_cell8.bin && ${VVP} cell/test_cell8.bin ${VVP_POST}

test_adder1: adder/test_adder1.sv adder/adder1.sv
	${IVERILOG} $^ -o adder/test_adder1.bin && ${VVP} adder/test_adder1.bin ${VVP_POST}

test_adder2: adder/test_adder2.sv adder/adder2.sv
	${IVERILOG} $^ -o adder/test_adder2.bin && ${VVP} adder/test_adder2.bin ${VVP_POST}

test_adder3: adder/test_adder3.sv adder/adder3.sv
	${IVERILOG} $^ -o adder/test_adder3.bin && ${VVP} adder/test_adder3.bin ${VVP_POST}

test_adder4: adder/test_adder4.sv adder/adder4.sv
	${IVERILOG} $^ -o adder/test_adder4.bin && ${VVP} adder/test_adder4.bin ${VVP_POST}

test_adder_n: adder/test_adder_n.sv adder/adder_n.sv
	${IVERILOG} $^ -o adder/test_adder_n.bin && ${VVP} adder/test_adder_n.bin ${VVP_POST}

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
