# Lab 3: Coffee Machine FSM & State Encoding

## Overview
This repository contains the RTL design, synthesis analysis, and physical implementation of a Finite State Machine (FSM) controlling a coin-operated coffee machine. The FSM processes coin insertion signals and triggers a coffee dispense output once the required condition (5 coins) is met.

A primary focus of this project is the hands-on comparative analysis of different FSM state encoding methods (Binary, Gray, One-Hot, Two-Hot) and validating the physical implementation timing using Gate-Level simulation.

## Directory Structure
* **`rtl/`**: Verilog source code (`lab_3.v`) implementing the FSM logic.
* **`tb/`**: Testbench environment (`tb_lab_3.v`) generating clock, reset, and coin insertion stimuli.
* **`sim/`**: Simulation results.
  * `pre_pnr_rtl/`: Behavioral RTL simulation waveform verifying the basic FSM logic and state transitions.
  * `post_pnr_one_hot/`: Gate-level simulation running on the Vivado Netlist and SDF file, verifying hardware delays and the physical One-Hot encoding scheme.
* **`synth/`**: Synthesis reports (Area, Timing, FSM logs) generated via Mentor Graphics Precision. The results are categorized by the state encoding algorithm used:
  * `Binary/`
  * `Gray/`
  * `One_Hot/`
  * `Two_Hot/`
* **`pnr/`**: Place and Route (Implementation) outputs from Xilinx Vivado specifically for the One-Hot encoding design. Includes the generated Verilog Netlist (`.v`) and Standard Delay Format (`.sdf`) files.

## Hardware Target & Tools
* **Target Device:** Xilinx-AMD Artix-7 
* **Synthesis Tool:** Mentor Graphics Precision
* **Place & Route Tool:** Xilinx Vivado
* **Simulation Tool:** ModelSim
