setDesignMode -topRoutingLayer 6
#setRouteMode -earlyGlobalMaxRouteLayer 6
setPlaceMode -place_global_place_io_pins true
set_interactive_constraint_modes {setup_con}
set_false_path -from [get_ports]
set_false_path -to [get_ports]
set_interactive_constraint_modes {}
#place_design -noPrePlaceOpt
defOut ${DESIGN}_${ROLL}.unopt.def
#optDesign -preCTS
place_opt_design
defOut ${DESIGN}_${ROLL}.opt.def
saveDesign ${DESIGN}_${ROLL}_place.inn

