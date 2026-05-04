# Lab 1: Hard Coded Time Base Generator

## Overview
This repository contains the design, simulation, and synthesis files for a Hard Coded Time Base Generator, implemented in Verilog[cite: 1]. 
The system acts as a synchronous counter that generates a single-cycle Terminal Count (TC) pulse exactly every 100 clock cycles[cite: 1]. This type of mechanism is typically used to periodically enable counters or other synchronous systems[cite: 1].

## Directory Structure
* **`docs/`**: Original laboratory assignment and requirements[cite: 1].
* **`report/`**: Final submitted lab report including screenshots and documentation.
* **`rtl/`**: Verilog source code (`time_base.v`) containing the counter logic.
* **`tb/`**: Testbench environment (`tb_time_base.v`) used to stimulate and verify the design.
* **`sim/`**: Simulation waveforms proving the correct functionality of the TC pulse generation after exactly 100 cycles.
* **`synth/`**: Synthesis results (RTL & Technology Schematics) generated via Mentor Graphics Precision and Xilinx Vivado.
* **`pnr/`**: Place and Route (Implementation) results, including the Vivado Device View and XDC constraints file for the physical board.

## Hardware Target
* **Device:** Xilinx-AMD Artix-7 (Basys 3 FPGA Board)[cite: 1]
* **Inputs:** `clk` (System Clock), `reset` (Active-high synchronous reset)[cite: 1]
* **Outputs:** `tc` (Terminal Count pulse)[cite: 1]
