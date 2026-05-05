##############################
# Pin Locations and Voltages #
##############################
set_property PACKAGE_PIN W5 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

set_property PACKAGE_PIN U18 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

set_property PACKAGE_PIN H1 [get_ports {tc}]
set_property IOSTANDARD LVCMOS33 [get_ports {tc}]

##########################
# Configuration Settings #
##########################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
