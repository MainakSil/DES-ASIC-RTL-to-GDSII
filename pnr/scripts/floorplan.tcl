if {$fplan == 0} {
	floorPlan -site ${site_id} -r $AR $UR 0 0 0 0
}
if {$fplan == 1} {
	floorplan -site ${site_id} -s $chip_width $chip_height 0 0 0 0
}
#Explore other setting of floorplan command
#
saveDesign ${DESIGN}_${ROLL}_fplan.inn



