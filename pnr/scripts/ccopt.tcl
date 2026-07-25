set_ccopt_property buffer_cells { BUF_X4 BUF_X8 BUF_X16 BUF_X32 CLKBUF_X1 CLKBUF_X2 CLKBUF_X3 }
set_ccopt_property inverter_cells { INV_X8 INV_X16 INV_X32 }
set_ccopt_property clock_gating_cells {CLKGATE_X1 CLKGATE_X2 CLKGATE_X4 CLKGATE_X8}
set_ccopt_property use_inverters true
set_ccopt_property target_max_trans inf
set_ccopt_property target_skew inf
create_ccopt_clock_tree_spec

#ccopt_design -cts

