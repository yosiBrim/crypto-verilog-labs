# DES Permutation & Inverse Permutation (Lab 4)

## Overview
This directory contains a strictly structural Verilog implementation of the Initial Permutation (IP) and Inverse Initial Permutation (IP^-1) operations, as defined in the Data Encryption Standard (DES) cryptographic algorithm (FIPS PUB 46-3). 

## Design Details
Unlike automated array-based assignments, this implementation utilizes rigorous, bit-by-bit manual hardwiring. Explicit `assign` statements are used to route all 64 bits individually, demonstrating low-level hardware routing control. The design meticulously adapts the standard DES `[1:64]` mathematical notation into the standard Verilog `[63:0]` vector convention.

* **`Permutation` (DUT1):** Receives a 64-bit plaintext block and performs the Initial Permutation routing.
* **`In_Permutation` (DUT2):** Receives the 64-bit scrambled block and restores it to its exact original state.

## Functional Verification
The testbench (`TB_Permutation.v`) chains both modules in series (DUT1 output directly drives DUT2 input) to prove that the permutation and its inverse perfectly cancel each other out. 

**Test Sequence:**
1. Injects the base hex pattern `64'h0123456789abcdef`.
2. Applies a 4-bit circular left rotation every 50ns across 16 hardcoded iterations to validate the routing logic against changing data vectors.
3. A `$monitor` system task continuously logs the original input, the intermediate permuted data, and the restored output.

## Simulation Results
The verification environment confirms 100% data recovery. The provided transcript logs and waveform captures in the `sim/` directory demonstrate that across all 800ns of simulation and 16 test vectors, the restored output matches the original input flawlessly.
