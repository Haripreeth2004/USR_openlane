# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

# Verilog sources
VERILOG_SOURCES += $(PWD)/UAR_behav_8bit.v

# Top-level module
TOPLEVEL = UAR_behav_8bit

# Python test file (Cocotb testbench)
MODULE = tb_UAR_coco

# include cocotb's make rules
include $(shell cocotb-config --makefiles)/Makefile.sim

# Output VCD file
VCD_FILE = dump_2.vcd

# GTKWave viewer
GTK_CMD = gtkwave

# Rule to open GTKWave with the generated VCD file
view:
	@echo "Opening GTKWave..."
	$(GTK_CMD) $(VCD_FILE)

