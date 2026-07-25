
source /home/cdsl15/Downloads/syn_pnr_pt_flow/pt/user_settings.tcl

set target_library $LIBRARY_DB_SET

set link_library "*  $LIBRARY_DB_SET"



read_verilog $POST_LAY_VERILOG

current_design $DESIGN
link
read_sdc $SDC_FILE
read_parasitics $SPEF_FILE
complete_net_parasitics -complete_with zero
report_annotated_parasitics -check
report_annotated_parasitics -list_annotated

set inPorts [all_inputs]
set theClocks [get_clock]
set clockNames [get_attribute $theClocks full_name] 
set inPortsNoClock [remove_from_collection $inPorts $clockNames] 
#set all_nets [get_nets -hierarchical *]
#set all_nets_NoClock [remove_from_collection $all_nets $clockNames] 
#Optional
set_false_path -from [all_inputs]
set_false_path -to [all_outputs]
set_propagated_clock [get_ports $clockNames]

#Timing analysis for setup
report_timing -nets -delay_type max -path_type full_clock_expanded -nosplit -capacitance -max_paths $max_path_no -significant_digits 6 -slack_lesser_than $clock_period


##Average statistical power analysis
set power_enable_analysis TRUE
set power_analysis_mode averaged


set_switching_activity -static_probability 0.5 -toggle_rate $input_toggle_rate -period $clock_period $inPortsNoClock
set_switching_activity -static_probability 0.5 -toggle_rate $reg_toggle_rate -period $clock_period -type registers -hierarchy
set_switching_activity -static_probability 0.5 -toggle_rate 2 -period $clock_period $clockNames

update_power
report_switching_activity
report_power -verbose -nosplit
#report_power -cell_power -leaf -sort_by name -nosplit > power_cell.txt
report_power -hierarchy



exit

