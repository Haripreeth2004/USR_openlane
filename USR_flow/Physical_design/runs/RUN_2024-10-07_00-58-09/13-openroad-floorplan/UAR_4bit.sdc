###############################################################################
# Created by write_sdc
###############################################################################
current_design UAR_4bit
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 25.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {d_in[0]}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {d_in[1]}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {d_in[2]}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {d_in[3]}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {select[0]}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {select[1]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[0]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[1]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[2]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {q[3]}]
set_load -pin_load 0.0334 [get_ports {q[2]}]
set_load -pin_load 0.0334 [get_ports {q[1]}]
set_load -pin_load 0.0334 [get_ports {q[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {d_in[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {d_in[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {d_in[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {d_in[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {select[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {select[0]}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_capacitance 0.2000 [current_design]
set_max_fanout 10.0000 [current_design]
