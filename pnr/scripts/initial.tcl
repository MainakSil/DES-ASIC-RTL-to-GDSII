
#set USER_DIR $::env(USER_DIR)
source /home/cdsl14/Downloads/test_innovus/syn_pnr_pt_flow/pnr/user_files/user_settings.tcl

set init_gnd_net $GND_NET
set init_verilog $VERILOG_FILES
set init_lef_file $LEF_FILES
set init_mmmc_file $MMMC_FILE
set init_top_cell $TOPCELL
set init_pwr_net $POWER_NET
setDesignMode -process $process_node
init_design

saveDesign ${DESIGN}_${ROLL}_init.inn




