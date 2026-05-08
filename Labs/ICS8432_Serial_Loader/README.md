# ICS8432 Serial Loader Controller

This repository contains the RTL design, verification, and hardware constraints for a custom Serial Loader Controller targeting the **Renesas/IDT ICS8432-51** Differential LVPECL Frequency Synthesizer.

## 📄 Project Overview
The objective of this project is to implement a Finite State Machine (FSM) in Verilog that interfaces with the ICS8432-51 device. The controller translates a parallel 13-bit configuration word into a strictly timed serial bitstream (`S_DATA`, `S_CLOCK`, `S_LOAD`), adhering precisely to the timing specifications defined in the component's datasheet.

## 🧠 Key Features & Design Architecture
* **Protocol Implementation:** Custom serial protocol generation injecting a mandated 'NULL' bit between the `T` and `N` configuration fields.
* **Asynchronous Edge Detection:** Features a synchronous falling-edge detector for the `START` signal, avoiding unsafe `negedge` triggers in the main FSM and preventing metastability.
* **FSM Control:** A robust 4-state machine (`IDLE`, `SHIFT_LOW`, `SHIFT_HIGH`, `LATCH`) ensuring setup and hold times are met for the target device.
* **Hardware Target:** Fully constrained and implemented for the **Xilinx Artix-7 FPGA (Basys3 Board)**.

## 📊 Implementation & Performance Results
The design has been fully synthesized, placed, and routed in Vivado with exceptional efficiency:
* **Timing Closure:** Successfully meets all timing constraints for a **100MHz system clock** (10ns period), achieving a positive Worst Negative Slack (WNS) of **+7.107ns**.
* **Resource Utilization:** Highly optimized logic footprint, consuming only **25 Slice Registers** and efficiently mapping I/O buffers without wasting FPGA resources.

## 📁 Repository Structure
* `/rtl`: Contains the synthesizable Verilog source code (`ics8432_serial_loader.v`).
* `/tb`: Contains the testbench (`tb_ics8432_loader.v`) simulating 5 distinct configuration vectors including edge cases.
* `/constraints`: Contains the `.xdc` file mapping the RTL signals to the physical Basys3 hardware (switches, buttons, and LEDs).
* `/docs`: Contains the final engineering report including RTL/Technology schematics, resource utilization, device floorplanning, and the component datasheet.

## 🛠 Verification
The RTL logic was initially verified via behavioral simulation. The final physical implementation was validated using **Post-Implementation Gate-Level Timing Simulation** in Vivado, proving that the strict serial protocol remains completely robust under real silicon propagation delays and routing latencies.
