addFiller -cell {DECAPx10_ASAP7_75t_R  } -prefix FILLER_DECAP_
addFiller -cell {DECAPx6_ASAP7_75t_R   } -prefix FILLER_DECAP_
addFiller -cell {DECAPx4_ASAP7_75t_R   } -prefix FILLER_DECAP_
addFiller -cell {TAPCELL_ASAP7_75t_R } -prefix FILLER_TAP_
addFiller -cell {FILLER_ASAP7_75t_R FILLERxp5_ASAP7_75t_R } -prefix FILLER

setExtractRCMode -engine postRoute -effortLevel signoff
extractRC
rcOut -spef $DESIGN.postFill.spef
saveDesign -verilog -def ${DESIGN}_${ROLL}_signoff.inn
ln -s ${DESIGN}_${ROLL}_signoff.inn.dat ${DESIGN}_signoff.inn.dat
summaryReport -outfile post_fill_summary.rpt
