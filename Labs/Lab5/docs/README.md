# Lab 5: DES S-Box Architecture & ROM Implementations

This repository contains the hardware implementation and verification of the Data Encryption Standard (DES) Substitution Boxes (S-Boxes). The lab focuses on exploring different memory instantiation techniques within an FPGA environment.

## 📄 Objectives
In DES, S-Boxes provide the critical non-linear "Confusion" element of the encryption. This project evaluates two distinct hardware architectures for mapping a 4-bit address to a 4-bit data output (16x4 ROM).

## 🏗 Hardware Architectures Explored

### 1. Distributed Logic (LUTs) via `case` Statement
- **Implementation:** `sbox_casemode.v`
- **Description:** The ROM is inferred using a Verilog `case` statement.
- **Hardware Mapping:** The synthesis tool (Vivado) maps this directly into the Artix-7 **Slice LUTs** (Look-Up Tables). 
- **Characteristics:** Purely combinational logic. Zero clock-cycle latency.

### 2. Dedicated Block RAM (BRAM) via Xilinx IP
- **Implementation:** Simulated in `tb_bram_sbox.v`
- **Description:** The ROM is implemented using the Vivado Block Memory Generator IP.
- **Hardware Mapping:** Mapped to the dedicated **BRAM18/BRAM36** primitives on the FPGA die.
- **Characteristics:** Synchronous logic. Requires a clock edge to read data, resulting in a 1-clock cycle latency. Highly efficient for large memory blocks as it saves logic fabric (LUTs).

## 📊 Synthesis & Verification
- Both implementations were simulated to guarantee functional equivalence against the DES standard S-Box tables.
- **Utilization:** The `case` statement approach demonstrated an extremely low logic footprint (only a few LUTs required), making it ideal for the small 16x4 tables used in DES.

## 🚀 Repository Structure
- `rtl/`: Contains the synthesizable Verilog code for the combinational S-Box.
- `tb/`: Contains the testbenches for both the combinational (`tb_sbox_casemode`) and the BRAM (`tb_bram_sbox`) implementations.
