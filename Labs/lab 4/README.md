# Lab 4: DES Permutation and Inverse Permutation

## Overview
This repository contains the Verilog implementation and simulation of the data permutation and its inverse, taken directly from the Data Encryption Standard (DES) algorithm (FIPS PUB 46-3). 

## Architecture
The verification environment chains two hardware modules in series to prove functional correctness:
1. **Permutation Module (`DUT1`):** Takes a 64-bit input and transposes the bits according to the DES standard.
2. **Inverse Permutation Module (`DUT2`):** Takes the 64-bit scrambled output from `DUT1` and restores it to its original 64-bit state.

## Verification (Testbench)
The testbench validates the logic using a Stimulus Pattern Generator that applies a circular left rotation on the test pattern `64'h0123456789abcdef`[cite: 3]. 
System tasks (`$monitor`) are deployed to track the 64-bit data bus at three critical stages[cite: 3]:
* Input to `DUT1` (Original data)[cite: 3]
* Output of `DUT1` / Input to `DUT2` (Permuted data)[cite: 3]
* Output of `DUT2` (Restored data)[cite: 3]

## Directory Structure
* **`docs/`**: Assignment specifications.
* **`rtl/`**: Verilog source code for both permutation modules.
* **`tb/`**: Verilog testbench.
* **`sim/`**: ModelSim transcript logs and waveform captures of the rotating pattern.
