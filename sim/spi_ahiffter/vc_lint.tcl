#Liberty files are needed for logical and physical netlist designs

set search_path "../lib"
set link_library" lsi_10k.db"
#set search_path "../rtl/"

set_app_var enable_lint true

configure_lint_tag -goal lint_rtl

analyze -verbose -format verilog "../../rtl/baud_rate_generator.v"

elaborate baud_rate_generator

check_lint

report_lint -verbose -file report_lint_baud_rate_generator.txt
