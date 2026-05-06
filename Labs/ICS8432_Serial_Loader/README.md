# ICS8432 Serial Loader Controller

This repository contains the RTL design, verification, and hardware constraints for a custom Serial Loader Controller targeting the **Renesas/IDT ICS8432-51** Differential LVPECL Frequency Synthesizer.

## 📄 Project Overview
The objective of this project is to implement a Finite State Machine (FSM) in Verilog that interfaces with the ICS8432-51 device. The controller translates a parallel 13-bit configuration word into a strictly timed serial bitstream (`S_DATA`, `S_CLOCK`, `S_LOAD`), adhering precisely to the timing specifications defined in the component's datasheet.

## 🧠 Key Features & Design Architecture
* **Protocol Implementation:** Custom serial protocol generation injecting a mandated 'NULL' bit between the `T` and `N` configuration fields.
* **Asynchronous Edge Detection:** Features a synchronous falling-edge detector for the `START` signal, avoiding unsafe `negedge` triggers in the main FSM.
* **FSM Control:** A robust 4-state machine (`IDLE`, `SHIFT_LOW`, `SHIFT_HIGH`, `LATCH`) ensuring setup and hold times are met for the target device.
* **Hardware Target:** Fully constrained and synthesized for the **Xilinx Artix-7 FPGA (Basys3 Board)**.

## 📁 Repository Structure
* `/rtl`: Contains the synthesizable Verilog source code (`ics8432_serial_loader.v`).
* `/tb`: Contains the testbench (`tb_ics8432_loader.v`) simulating 5 distinct configuration vectors.
* `/constraints`: Contains the `.xdc` file mapping the I/O to the Basys3 switches, buttons, and LEDs.
* `/docs`: Contains the component datasheet, assignment specifications, FSM state diagrams, and the final project report.

## 🛠 Verification & Synthesis
The design has been verified via ModelSim/Vivado Simulation (Post-Implementation Timing) and successfully synthesized. See the `/docs` folder for detailed Utilization and Device View reports.
