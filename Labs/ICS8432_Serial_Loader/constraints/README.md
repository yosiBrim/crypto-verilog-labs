# Hardware Constraints

This directory contains the physical pin mappings and timing constraints required to implement the design on the target FPGA silicon.

## 📄 File Overview
* `basys3_constraints.xdc`: The Xilinx Design Constraints (XDC) file tailored for the Digilent Basys3 development board.

## 🔌 Hardware Mapping
* **Clock System:** Configured for the onboard 100MHz oscillator (Pin W5) with a defined 10.00ns period.
* **User Inputs:** * `START` trigger is mapped to the Top Push Button.
  * Asynchronous `RST` is mapped to the Center Push Button.
  * `CONFIG_DATA[12:0]` is mapped across the 13 rightmost slide switches.
* **Outputs:** The serial interface signals (`S_CLOCK`, `S_DATA`, `S_LOAD`, and `nP_LOAD`) are routed to the onboard LEDs for immediate visual validation and debugging.
