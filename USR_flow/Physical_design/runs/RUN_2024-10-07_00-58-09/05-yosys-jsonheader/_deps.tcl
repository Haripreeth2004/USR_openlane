set ::_synlig_defines [list]
verilog_defines -DPDK_sky130A
lappend ::_synlig_defines +define+PDK_sky130A
verilog_defines "-DSCL_sky130_fd_sc_hd\""
lappend ::_synlig_defines "+define+SCL_sky130_fd_sc_hd\""
verilog_defines -D__openlane__
lappend ::_synlig_defines +define+__openlane__
verilog_defines -D__pnr__
lappend ::_synlig_defines +define+__pnr__
verilog_defines -DUSE_POWER_PINS
lappend ::_synlig_defines +define+USE_POWER_PINS
read_verilog -sv -lib /media/hari-the-geth/HPCORE/Openlane2_projects/USR_flow/Physical_design/runs/RUN_2024-10-07_00-58-09/tmp/c6597ca1eecd4994b6049690e7467bd6.bb.v
set ::env(SYNTH_LIBS) /media/hari-the-geth/HPCORE/Openlane2_projects/USR_flow/Physical_design/runs/RUN_2024-10-07_00-58-09/tmp/92f16bed781c4ee6ae9752071abbedd0.lib
