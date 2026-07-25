create_clock [get_ports {clk}] -period 500 -waveform {0 250}
set_max_delay 200 -through [get_ports *]

set_max_fanout 8 [current_design]
set_max_transition 200 [current_design]
#set_max_capacitance 0.2 [current_design]
