# Lab 2: Counter, Decoder, and MUX Design

## Overview
Verilog implementation of a system integrating a 4-bit free-running up counter, a custom decoder, and a multiplexer (MUX)[cite: 4]. 
Demonstrates synchronous logic, combinational data routing, and the usage of Verilog Cross-Module References (XMR) in the testbench to monitor internal signals[cite: 4].

## Functionality
* **Counter:** 4-bit synchronous up counter with active-high reset[cite: 4].
* **Decoder:** Asserts a specific bit in a 4-bit `DETECT` bus based on the counter's current range (0-3, 4-7, 8-11, 12-15)[cite: 4].
* **MUX:** Controlled by the `SEL` signal. Routes either the raw counter output (`Q`) or the decoded output (`DETECT`) to the final system output (`Y`)[cite: 4].
