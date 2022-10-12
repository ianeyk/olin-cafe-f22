# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -g2012 -Wall -y ./ -I ./
VVP=vvp
VVP_POST=-fst
# VIVADO=vivado -mode batch -source

# Look up .PHONY rules for Makefiles
.PHONY: clean submission

test_practice : practice.sv test_practice.sv
	${IVERILOG} $^ -o test_practice.bin && ${VVP} test_practice.bin ${VVP_POST}
waves_practice : test_practice
	gtkwave practice.fst -a practice.gtkw


# add targets for your tests of your adders and muxes here!
test_mux2: test_mux2.sv mux2.sv
	${IVERILOG} $^ -o test_mux2.bin && ${VVP} test_mux2.bin ${VVP_POST}

mux: ./generated_muxes/test_mux$(filter-out mux,$(MAKECMDGOALS)).sv ./generated_muxes/mux$(filter-out mux,$(MAKECMDGOALS)).sv
		python3 generate_mux.py $(filter-out $@,$(MAKECMDGOALS))
		${IVERILOG} $^ -o ./generated_muxes/test_mux$(filter-out $@,$(MAKECMDGOALS)).bin && ${VVP} ./generated_muxes/test_mux$(filter-out $@,$(MAKECMDGOALS)).bin ${VVP_POST}

%:      # thanks to chakrit
	@:    # thanks to William Pursell

test_adder1: test_adder1.sv adder1.sv
	${IVERILOG} $^ -o test_adder1.bin && ${VVP} test_adder1.bin ${VVP_POST}

adder: ./generated_adders/test_adder$(filter-out adder,$(MAKECMDGOALS)).sv ./generated_adders/adder$(filter-out adder,$(MAKECMDGOALS)).sv
		python3 generate_adder.py $(filter-out $@,$(MAKECMDGOALS))
		${IVERILOG} $^ -o ./generated_adders/test_adder$(filter-out $@,$(MAKECMDGOALS)).bin && ${VVP} ./generated_adders/test_adder$(filter-out $@,$(MAKECMDGOALS)).bin ${VVP_POST}

%:      # thanks to chakrit
	@:    # thanks to William Pursell


# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd *.fst vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml
	rm -rf .Xil

# Call this to generate your submission zip file.
submission:
	zip submission.zip Makefile *.sv README.md *.pdf
