# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -Wno-sensitivity-entire-vector -Wno-sensitivity-entire-array -g2012 -Y.sv -I ./hdl -I ./tests
VVP=vvp
VVP_POST=-fst
.PHONY: clean submission

ADDER_SOURCES=hdl/adder_1.sv hdl/adder_n.sv

test_comparators: tests/test_comparators.sv hdl/comparator_eq.sv hdl/comparator_lt.sv hdl/comparator_lt_unsigned.sv ${ADDER_SOURCES}
	${IVERILOG} $^ -o test_slt.bin && ${VVP} test_slt.bin ${VVP_POST}

test_mux2: tests/test_mux2.sv hdl/mux2.sv
	${IVERILOG} $^ -o test_mux2.bin && ${VVP} test_mux2.bin ${VVP_POST}

waves_comparator: test_comparators
	gtkwave comparators.fst --save=wave_cfgs/comparators.gtkw

waves_pulse_generator: tests/test_pulse_generator.sv
	gtkwave pulse_generator.fst --save=wave_cfgs/pulse_generator.gtkw

waves_triangle_generator: tests/test_triangle_generator.sv
	gtkwave triangle_generator.fst --save=wave_cfgs/triangle_generator.gtkw

waves_pwm: tests/test_pwm.sv
	gtkwave pwm.fst --save=wave_cfgs/pwm.gtkw

test_pulse_generator: tests/test_pulse_generator.sv hdl/pulse_generator.sv hdl/comparator_lt.sv hdl/comparator_eq.sv ${ADDER_SOURCES}
	${IVERILOG} $^ -o test_pulse_generator.bin && ${VVP} test_pulse_generator.bin ${VVP_POST}

test_triangle_generator: tests/test_triangle_generator.sv hdl/triangle_generator.sv hdl/mux2.sv hdl/comparator_eq.sv ${ADDER_SOURCES}
	${IVERILOG} $^ -o test_triangle_generator.bin && ${VVP} test_triangle_generator.bin ${VVP_POST}

test_pwm: tests/test_pwm.sv hdl/pulse_generator.sv hdl/pwm.sv hdl/comparator_eq.sv hdl/comparator_lt_unsigned.sv ${ADDER_SOURCES}
	@echo "This might take a while, we're testing a lot of clock cycles..."
	${IVERILOG} $^ -o test_pwm.bin && ${VVP} test_pwm.bin ${VVP_POST}

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.fst vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml

homework_pdf: README.md
	pandoc $^ -o Homework5.pdf

# Call this to generate your submission zip file.
submission: clean
	zip submission.zip Makefile hdl/*.sv tests/*.sv *.md *.pdf wave_cfgs/*.gtkw
