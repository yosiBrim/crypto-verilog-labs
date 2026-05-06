# RTL Source Code - DES Encryption

This directory contains the synthesizable Verilog HDL source files for the Data Encryption Standard (DES) implementation. The design follows a modular architecture to ensure clarity, reusability, and efficient hardware mapping.

## 📁 File Descriptions

*   **des_top.v**: The top-level module that integrates the data path, Feistel network, and key scheduling logic.
*   **permutations.v**: Contains combinational logic for:
    *   Initial Permutation (IP).
    *   Final Permutation (FP).
    *   Expansion Permutation (E-bit).
    *   Permutation P (within the Feistel function).
*   **sbox_logic.v**: Implements the eight DES S-Boxes. These are optimized as Look-Up Tables (LUTs) to minimize propagation delay.
*   **key_schedule.v**: Logic for generating sixteen 48-bit subkeys from the initial 64-bit key, including circular shifts and Permuted Choice 1 & 2 (PC-1, PC-2).
*   **feistel_function.v**: The core logic of the DES round, combining the expansion, S-Box substitution, and P-permutation.

## 🏗 Architecture Overview

The implementation is designed for the **Xilinx Artix-7 (Basys3)** FPGA. Key architectural features include:

### 1. Combinational Permutations
All bit-level permutations (IP, FP, E, P) are implemented using direct wiring assignments. This approach incurs zero clock cycles of latency and utilizes minimal routing resources[cite: 2].

### 2. S-Box Implementation
S-Boxes are implemented using `case` statements, which the Vivado synthesis tool maps efficiently to 6-input LUTs[cite: 2]. This ensures high-speed substitution logic.

### 3. Synchronous Design
The 16-round encryption cycle is managed by a central Finite State Machine (FSM) or a pipelined structure (depending on the specific lab version), ensuring stability across the 100 MHz clock domain[cite: 2].

## 🛠 Synthesis Guidelines
*   **Target Device:** Artix-7 XC7A35TCPG236-1[cite: 2].
*   **Optimization Goal:** Balanced between Area (LUT count) and Speed (Max Frequency).
*   **Standard:** Verilog-2001 or SystemVerilog.
