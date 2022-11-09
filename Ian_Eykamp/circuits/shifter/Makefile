# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -g2012 -Wall -y./hdl -y./tests -Y.sv -I./hdl
VVP=vvp
VVP_POST=-fst
# VIVADO=vivado -mode batch -source # Not used in this demo.

#target : # dependencies
test_mux2: test_mux2.sv mux2.sv
	${IVERILOG} $^ -o test_mux2.bin && ${VVP} test_mux2.bin ${VVP_POST}

shifter: ./generated_shifters/test_shifter$(filter-out shifter,$(MAKECMDGOALS)).sv ./generated_shifters/shifter$(filter-out shifter,$(MAKECMDGOALS)).sv
		python3 generate_mux.py $(filter-out $@,$(MAKECMDGOALS))
		python3 generate_shifter.py $(filter-out $@,$(MAKECMDGOALS))
		${IVERILOG} $^ -o ./generated_shifters/test_shifter$(filter-out $@,$(MAKECMDGOALS)).bin && ${VVP} ./generated_shifters/test_shifter$(filter-out $@,$(MAKECMDGOALS)).bin ${VVP_POST}

%:      # thanks to chakrit
	@:    # thanks to William Pursell

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
