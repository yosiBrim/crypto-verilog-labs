# Precision Generated
create_clock [get_ports {clk}] -name {clk} -period 10 -waveform {0 5}
create_clock -name {VirtualClock} -period 10 -waveform {0 5}
set_input_delay -clock [get_clocks {VirtualClock}] -add_delay [get_ports {reset sel}]
set_output_delay -clock [get_clocks {VirtualClock}] -add_delay [get_ports {y*}]

# Pin Locations and Voltages 
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports {clk}];
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {reset}];
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports {sel}];
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {y[0]}];
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {y[1]}];
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {y[2]}];
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {y[3]}];

# Configuration Settings 
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
