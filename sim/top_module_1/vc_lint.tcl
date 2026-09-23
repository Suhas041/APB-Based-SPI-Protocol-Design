#Liberty files are needed for logical and physical netlist designs

set search_path "../lib"
set link_library" lsi_10k.db"
#set search_path "../rtl/"

set_app_var enable_lint true

configure_lint_tag -goal lint_rtl

analyze -verbose -format verilog "../../rtl/top_module_rtl.v"

analyze -verbose -format verilog "../../rtl/baud_rate_generator.v"
analyze -verbose -format verilog "../../rtl/shift_register_cp.v"
analyze -verbose -format verilog "../../rtl/slave_select_block.v"
analyze -verbose -format verilog "../../rtl/apb_slave_interface.v"

elaborate top_module

check_lint

report_lint -verbose -file top_module.txt
