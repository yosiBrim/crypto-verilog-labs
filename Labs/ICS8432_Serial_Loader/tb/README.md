# Testbench Verification Environment

This directory contains the simulation sources used to verify the functional correctness and temporal behavior of the Serial Loader design.

## 📄 File Overview
* `tb_ics8432_loader.v`: The primary verification module.

## 🔬 Verification Strategy
* **Clock Generation:** Simulates a 100MHz system clock to perfectly match the target Basys3 FPGA hardware environment.
* **Test Vectors:** Exercises the FSM using 5 distinct configuration scenarios (including boundary cases like all 1s, all 0s, and alternating binary patterns) to guarantee protocol stability across arbitrary data.
* **System Monitoring:** Implements `$monitor` and `$display` system tasks to provide a clear, real-time console log of all critical signal transitions during the serial shifting and latching phases.
