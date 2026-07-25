set_ccopt_property buffer_cells $clk_buf_list
set_ccopt_property inverter_cells $clk_inv_list
set_ccopt_property clock_gating_cells $clk_gate_list
set_ccopt_property use_inverters true
set_ccopt_property target_max_trans $clk_tran
set_ccopt_property target_skew $clk_skew
create_ccopt_clock_tree_spec

#ccopt_build_clock_trees
#optDesign -postCTS

clock_opt_design -cts
timeDesign -postCTS
saveDesign ${DESIGN}_${ROLL}_ccopt.inn


