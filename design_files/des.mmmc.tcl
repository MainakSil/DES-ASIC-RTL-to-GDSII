#create_library_set -name typical_lib -timing [list $TYPICAL_LIB]
#create_op_cond -name PVT1 -library_file <> -P <> -V <> -T <>
#create_rc_corner -name rc-typ -cap_table $CAPTBL -T <>
#create_delay_corner -name dc_typical -library_set typical_lib -opcond PVT1 -rc_corner rc-typ
#create_constraint_mode -name setup_con -sdc_files [list $SDC_FILES]
#create_analysis_view -name setup -delay_corner dc_typical -constraint_mode setup_con
#set_analysis_view -setup {setup} -hold {setup}

	
create_library_set -name typical_lib -timing [list ${LIBRARY_SET}] 

create_rc_corner -name typ_cap -qx_tech_file "$QRC_TECH_FILE" -T {25} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0}

#create_op_cond -name PVT1 -library_file ${LIBRARY_SET} -P {1.0} -V {0.7} -T {25}

create_constraint_mode -name setup_con -sdc_files ${SDC_FILE}

create_delay_corner -name dc_typical -library_set {typical_lib} -rc_corner {typ_cap}

create_analysis_view -name setup -constraint_mode {setup_con} -delay_corner {dc_typical}

set_analysis_view -setup {setup} -hold {setup}

