
clearGlobalNets
#globalNetConnect VDD -type pgpin -pin vdd -inst * -module {}
#globalNetConnect VSS -type pgpin -pin vss -inst * -module {}
globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}

addWellTap -cell TAPCELL_ASAP7_75t_L -cellInterval $tap_interval -inRowOffset $tap_offset


#addRing -nets {VDD VSS} -type core_rings -follow io -layer {top metal5 bottom metal5 left metal6 right metal6} -width {top 1.5 bottom 1.5 left 1.5 right 1.5} -spacing {top 1.5 bottom 1.5 left 1.5 right 1.5} -offset {top 0.55 bottom 0.55 left 0.6 right 0.6} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

sroute -connect { blockPin padPin padRing corePin floatingStripe } \
    -layerChangeRange { M1 M6 } \
    -blockPinTarget { nearestTarget } \
    -padPinPortConnect { allPort oneGeom } \
    -padPinTarget { nearestTarget } \
    -corePinTarget { firstAfterRowEnd } \
    -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } \
    -allowJogging 1 \
    -crossoverViaLayerRange { M1 M6 } \
    -nets { VDD VSS } \
    -allowLayerChange 1 \
    -blockPin useLef \
    -targetViaLayerRange { M1 }

### Intervene Here. Manually fix the Top M1 Follow Rail

# setViaGenMode -viarule_preference { M2_M1p }

setAddStripeMode -stacked_via_bottom_layer M1 -stacked_via_top_layer M2 -allow_nonpreferred_dir stripe
setViaGenMode -ignore_viarule_enclosure true

addStripe -direction horizontal -set_to_set_distance [expr $var(row_height) * 2] -spacing [expr $var(row_height) - $var(std_cell_overlay_rail_width)] -ybottom_offset -[expr $var(std_cell_overlay_rail_width) * 0.5] -ytop_offset -[expr $var(std_cell_overlay_rail_width) * 0.5] -width  $var(std_cell_overlay_rail_width) -nets {VDD VSS} -layer M2

addStripe -direction horizontal -set_to_set_distance [expr $var(row_height) * 2] -spacing [expr $var(row_height) - $var(std_cell_overlay_rail_width)] -ybottom_offset -[expr $var(std_cell_overlay_rail_width) * 0.5] -ytop_offset -[expr $var(std_cell_overlay_rail_width) * 0.5] -width  $var(std_cell_overlay_rail_width) -nets {VDD VSS} -layer M1


setViaGenMode -ignore_viarule_enclosure true

editPowerVia -skip_via_on_pin {Pad Block Cover Standardcell} -skip_via_on_wire_shape {Ring Blockring Corewire Blockwire Iowire Padring Fillwire Noshape} -bottom_layer M1 -add_vias 1 -orthogonal_only 0 -top_layer M2

setViaGenMode -viarule_preference { M6_M5widePWR1p152 M5_M4widePWR0p864 M4_M3widePWR0p864 M3_M2widePWR0p936 M3_M2widePWR }

addStripe -extend_to design_boundary -skip_via_on_wire_shape Noshape -max_same_layer_jog_length 0.32 -set_to_set_distance $m3pwrset2set -skip_via_on_pin Standardcell -stacked_via_top_layer Pad -spacing $m3pwrspacing -xleft_offset $m3pwrxoffset -merge_stripes_value 0.16 -layer M3 -width $m3pwrwidth -nets {VDD VSS} -stacked_via_bottom_layer M2

setAddStripeMode -max_via_size { Stripe 100 100 100 } -via_using_exact_crossover_size true -stacked_via_bottom_layer M3 -stacked_via_top_layer M4

addStripe -extend_to design_boundary -direction horizontal -skip_via_on_wire_shape Noshape -max_same_layer_jog_length 0.32 -set_to_set_distance $m4pwrset2set -skip_via_on_pin Standardcell -spacing $m4pwrspacing -start_offset $m4pwrxoffset -merge_stripes_value 0.16 -layer M4 -width $m4pwrwidth -nets {VDD VSS}

setAddStripeMode -stacked_via_bottom_layer M4 -stacked_via_top_layer M5

setViaGenMode -bar_cut_orientation horizontal

addStripe -extend_to design_boundary -direction vertical -skip_via_on_wire_shape Noshape -max_same_layer_jog_length 0.32 -set_to_set_distance $m5pwrset2set -skip_via_on_pin Standardcell -spacing $m5pwrspacing -start_offset $m5pwrxoffset -merge_stripes_value 0.16 -layer M5 -width $m5pwrwidth -nets {VDD VSS}

setAddStripeMode -stacked_via_bottom_layer M5 -stacked_via_top_layer M6

setViaGenMode -bar_cut_orientation vertical

addStripe -extend_to design_boundary -direction horizontal -skip_via_on_wire_shape Noshape -max_same_layer_jog_length 0.32 -set_to_set_distance $m6pwrset2set -skip_via_on_pin Standardcell -spacing $m6pwrspacing -start_offset $m6pwrxoffset -merge_stripes_value 0.16 -layer M6 -width $m6pwrwidth -nets {VDD VSS}

#setAddStripeMode -stacked_via_bottom_layer M1 \
    -stacked_via_top_layer M2

#set xmax [expr $chip_width/$m3pwrset2set]    
#for {set i 0} {$i < $chip_width



#setSrouteMode -viaConnectToShape { noshape }
#sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal6(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal10(10) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal10(10) }


