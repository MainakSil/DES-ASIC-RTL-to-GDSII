##Design name
set DESIGN des
set PDK asap7nm
set PDK_DIR /home/cdsl14/Downloads/test_innovus/syn_pnr_pt_flow/asap7nm_pdk
set DESIGN_DIR /home/cdsl14/Downloads/test_innovus/syn_pnr_pt_flow/design_files
set RTL_PATH /home/cdsl14/Downloads/test_innovus/syn_pnr_pt_flow/rtl/$DESIGN

##Input RTL_FILES (provide absolute paths to avoid errors). Separate multiple files by space only
set RTL_FILES [list $RTL_PATH/verilog/common/crp.v \
$RTL_PATH/verilog/common/sbox1.v \
$RTL_PATH/verilog/common/sbox2.v \
$RTL_PATH/verilog/common/sbox3.v \
$RTL_PATH/verilog/common/sbox4.v \
$RTL_PATH/verilog/common/sbox5.v \
$RTL_PATH/verilog/common/sbox6.v \
$RTL_PATH/verilog/common/sbox7.v \
$RTL_PATH/verilog/common/sbox8.v \
$RTL_PATH/verilog/perf_opt/key_sel.v \
$RTL_PATH/verilog/perf_opt/des.v ]

set SDC_FILE $DESIGN_DIR/$DESIGN.sdc

set LIBRARY_DB_SET [list $PDK_DIR/lib/asap7sc7p5t_AO_LVT_TT_ccsa_211120.lib \
	$PDK_DIR/lib/asap7sc7p5t_INVBUF_LVT_TT_ccsa_211120.lib \
	$PDK_DIR/lib/asap7sc7p5t_OA_LVT_TT_ccsa_211120.lib \
	$PDK_DIR/lib/asap7sc7p5t_SEQ_LVT_TT_ccsa_220123.lib \
	$PDK_DIR/lib/asap7sc7p5t_SIMPLE_LVT_TT_ccsa_211120.lib ]


