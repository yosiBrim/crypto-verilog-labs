# DES Algorithm: Initial and Inverse Permutation Logic

This repository contains the hardware implementation and verification for the bit-level shuffling stages of the **Data Encryption Standard (DES)** algorithm.

## 📄 Overview
The project focuses on the mathematical symmetry between the **Initial Permutation (IP)** and the **Inverse Initial Permutation (IIP)**. In DES, these stages ensure that data is diffused at the bit level before and after the 16 rounds of the Feistel network.

## 📁 Included Files

1.  **Permutation.v (RTL):** Implements the Initial Permutation (IP). It rearranges the 64-bit input block based on the standard DES IP table.
2.  **Inverse_Permutation.v (RTL):** Implements the Final Permutation (FP). This is the exact inverse of the IP stage, designed to return the bits to their original positions.
3.  **TB_Permutation.v (Testbench):** A verification environment that cascades the two modules to prove their functional correctness.

## 🛠 Functional Logic
The core objective of this design is to satisfy the following mathematical identity:
**Inverse_Permutation(Permutation(Data)) == Data**

### Implementation Details:
- **Design Type:** Pure Combinational Logic (Zero-Latency).
- **Optimization:** Optimized for FPGA Look-Up Tables (LUTs) through direct wire assignments.
- **Verification Method:** Loopback testing using a $monitor system to compare Input vs. Final Output.

## 🚀 How to Run
1. Add both `Permutation.v` and `Inverse_Permutation.v` to your Vivado/ModelSim project as Design Sources.
2. Add `TB_Permutation.v` as a Simulation Source.
3. Run the simulation and observe the console output. A "PASS" status indicates that the bit-mapping is perfectly symmetrical.
