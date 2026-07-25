setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {t t t t t t t t t t} 
setAnalysisMode -analysisType  onChipVariation
setAnalysisMode -cppr both
route_opt_design
saveDesign -verilog -def ${DESIGN}_${ROLL}_route.inn
setExtractRCMode -engine postRoute -effortLevel high
extractRC
rcOut -spef $DESIGN.postRoute.spef
summaryReport -outfile post_route_summary.rpt

