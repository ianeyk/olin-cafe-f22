# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -g2012 -Wall -y ./hdl -I ./hdl
IVERILOG_SIM_ARGS= -y ./tests -I ./tests
VVP=vvp
VVP_POST=-fst
VIVADO=vivado -mode batch -source


CONWAY_SRCS=main/main.sv timer/timer_1second.sv timer/timer_8tick.sv decoder/decoder3_8.sv cell/cell8.sv cell_row/cell_row.sv cell_array/cell_array.sv adder/adder1.sv adder/adder2.sv adder/adder3.sv adder/adder4.sv adder/adder24.sv naive_comparator/comparator2_3.sv naive_comparator/comparator3.sv
# DECODER_SRCS=hdl/decoder*.sv
MAIN_SRCS=${CONWAY_SRCS}

# Look up .PHONY rules for Makefiles
.PHONY: clean submission remove_solutions

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

test_decoder1_2: decoder/test_decoder1_2.sv decoder/decoder1_2.sv
	${IVERILOG} $^ -o decoder/test_decoder1_2.bin && ${VVP} decoder/test_decoder1_2.bin ${VVP_POST}

test_decoder2_4: decoder/test_decoder2_4.sv decoder/decoder2_4.sv
	${IVERILOG} $^ -o decoder/test_decoder2_4.bin && ${VVP} decoder/test_decoder2_4.bin ${VVP_POST}

test_decoder3_8: decoder/test_decoder3_8.sv decoder/decoder3_8.sv
	${IVERILOG} $^ -o decoder/test_decoder3_8.bin && ${VVP} decoder/test_decoder3_8.bin ${VVP_POST}

test_cell_row: cell_row/test_cell_row.sv cell_row/cell_row.sv
	${IVERILOG} $^ -o cell_row/test_cell_row.bin && ${VVP} cell_row/test_cell_row.bin ${VVP_POST}

test_cell_array: cell_array/test_cell_array.sv cell_array/cell_array.sv
	${IVERILOG} $^ -o cell_array/test_cell_array.bin && ${VVP} cell_array/test_cell_array.bin ${VVP_POST}

test_timer_8tick: timer/test_timer_8tick.sv timer/timer_8tick.sv
	${IVERILOG} $^ -o timer/test_timer_8tick.bin && ${VVP} timer/test_timer_8tick.bin ${VVP_POST}

test_timer_1second: timer/test_timer_1second.sv timer/timer_1second.sv
	${IVERILOG} $^ -o timer/test_timer_1second.bin && ${VVP} timer/test_timer_1second.bin ${VVP_POST}

test_main: main/test_main.sv main/main.sv
	${IVERILOG} $^ -o main/test_main.bin && ${VVP} main/test_main.bin ${VVP_POST}

main.bit: $(MAIN_SRCS)
	@echo "########################################"
	@echo "#### Building FPGA bitstream        ####"
	@echo "########################################"
	${VIVADO} ./build.tcl

program_fpga_vivado: main.bit
	@echo "########################################"
	@echo "#### Programming FPGA (Vivado)      ####"
	@echo "########################################"
	${VIVADO} program.tcl

program_fpga_digilent: main.bit
	@echo "########################################"
	@echo "#### Programming FPGA (Digilent)    ####"
	@echo "########################################"
	djtgcfg enum
	djtgcfg prog -d CmodA7 -i 0 -f main.bit


# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd *.fst vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml
	rm -rf .Xil

# Call this to generate your submission zip file.
submission:
	zip submission.zip Makefile *.sv README.md docs/* *.tcl *.xdc *.fst
