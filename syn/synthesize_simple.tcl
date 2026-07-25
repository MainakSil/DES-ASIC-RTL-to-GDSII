
source /home/cdsl14/Downloads/test_innovus/syn_pnr_pt_flow/syn/user_settings.tcl

set target_library $LIBRARY_DB_SET
#When you synthesize RTL, use cells from this db
read_lib $target_library
read_hdl $RTL_FILES
elaborate $DESIGN
read_sdc $SDC_FILE
#RTL Elaboration,Logic Optimization,Technology Mapping,Timing Optimization,Design Rule Fixes,Area Optimization,Power Optimization,Netlist Generation
#Synthesize my RTL into an optimized gate-level netlist while trying to meet all timing, area, and design-rule constraints
#Compared with a basic compile, compile_ultra enables more aggressive optimizations, especially for timing.
syn_generic
syn_map
syn_opt


report_timing > $DESIGN_DIR/$DESIGN.report_timing.rpt
report_power > $DESIGN_DIR/$DESIGN.report_power.rpt
report_qor > $DESIGN_DIR/$DESIGN.report_qor.rpt
write_hdl > $DESIGN_DIR/$DESIGN.$PDK.genus.syn.v
write_sdc > $DESIGN_DIR/$DESIGN.genus.sdc
 write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge -setuphold split > $DESIGN_DIR/$DESIGN.delays.sdf
exit
