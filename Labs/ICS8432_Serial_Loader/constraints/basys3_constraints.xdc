## ----------------------------------------------------------------------------
## Basys3 XDC File for ICS8432 Serial Loader
## Author: Yosef (Yossi) Brim
## Project: Midterm - Serial Protocol Controller
## ----------------------------------------------------------------------------

## Clock signal (Internal 100MHz Oscillator)
set_property PACKAGE_PIN W5 [get_ports CLK]							
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]
 
## Reset (Mapped to Center Push Button - U18)
set_property PACKAGE_PIN U18 [get_ports RST]						
	set_property IOSTANDARD LVCMOS33 [get_ports RST]

## START Trigger (Mapped to Top Push Button - T18)
set_property PACKAGE_PIN T18 [get_ports START]						
	set_property IOSTANDARD LVCMOS33 [get_ports START]

## CONFIG_DATA [12:0] (Mapped to Slide Switches 0 to 12)
set_property PACKAGE_PIN V17 [get_ports {CONFIG_DATA[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[0]}]
set_property PACKAGE_PIN V16 [get_ports {CONFIG_DATA[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[1]}]
set_property PACKAGE_PIN W16 [get_ports {CONFIG_DATA[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[2]}]
set_property PACKAGE_PIN W17 [get_ports {CONFIG_DATA[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[3]}]
set_property PACKAGE_PIN W15 [get_ports {CONFIG_DATA[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[4]}]
set_property PACKAGE_PIN V15 [get_ports {CONFIG_DATA[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[5]}]
set_property PACKAGE_PIN W14 [get_ports {CONFIG_DATA[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[6]}]
set_property PACKAGE_PIN W13 [get_ports {CONFIG_DATA[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[7]}]
set_property PACKAGE_PIN V2 [get_ports {CONFIG_DATA[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[8]}]
set_property PACKAGE_PIN T3 [get_ports {CONFIG_DATA[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[9]}]
set_property PACKAGE_PIN T2 [get_ports {CONFIG_DATA[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[10]}]
set_property PACKAGE_PIN R3 [get_ports {CONFIG_DATA[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[11]}]
set_property PACKAGE_PIN W2 [get_ports {CONFIG_DATA[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CONFIG_DATA[12]}]

## Outputs (Mapped to LEDs to verify shifting visually)
set_property PACKAGE_PIN U16 [get_ports S_CLOCK]					
	set_property IOSTANDARD LVCMOS33 [get_ports S_CLOCK]
set_property PACKAGE_PIN E19 [get_ports S_DATA]					
	set_property IOSTANDARD LVCMOS33 [get_ports S_DATA]
set_property PACKAGE_PIN U19 [get_ports S_LOAD]					
	set_property IOSTANDARD LVCMOS33 [get_ports S_LOAD]
set_property PACKAGE_PIN V19 [get_ports nP_LOAD]					
	set_property IOSTANDARD LVCMOS33 [get_ports nP_LOAD]
