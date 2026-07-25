##Design name
set DESIGN des
set PDK asap7nm
set PDK_DIR /home/cdsl15/Downloads/syn_pnr_pt_flow/asap7nm_pdk
set DESIGN_DIR /home/cdsl15/Downloads/syn_pnr_pt_flow/design_files

set POST_LAY_VERILOG /home/cdsl15/Downloads/syn_pnr_pt_flow/pnr/${DESIGN}_signoff.inn.dat/$DESIGN.v.gz
set SDC_FILE $DESIGN_DIR/$DESIGN.sdc
set SPEF_FILE /home/cdsl15/Downloads/syn_pnr_pt_flow/pnr/$DESIGN.postFill.spef 


set LIBRARY_DB_SET [list $PDK_DIR/lib/asap7sc7p5t_AO_LVT_TT_ccsa_211120.db \
	$PDK_DIR/lib/asap7sc7p5t_INVBUF_LVT_TT_ccsa_211120.db \
	$PDK_DIR/lib/asap7sc7p5t_OA_LVT_TT_ccsa_211120.db \
	$PDK_DIR/lib/asap7sc7p5t_SEQ_LVT_TT_ccsa_220123.db \
	$PDK_DIR/lib/asap7sc7p5t_SIMPLE_LVT_TT_ccsa_211120.db ]

set max_path_no 5
set input_toggle_rate 0.1
set reg_toggle_rate 0.1
set clock_period 1000
