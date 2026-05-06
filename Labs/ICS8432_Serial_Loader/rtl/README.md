# RTL (Register Transfer Level) - Source Code

This directory contains the synthesizable Verilog source code for the ICS8432 Serial Loader controller.

## 📄 File Overview
* `ics8432_serial_loader.v`: The core module implementing the custom serial protocol.

## 🏗 Architecture Highlights
* **Finite State Machine (FSM):** A robust 4-state FSM (`IDLE`, `SHIFT_LOW`, `SHIFT_HIGH`, `LATCH`) ensures precise timing control, meeting the strict setup and hold specifications of the ICS8432 device.
* **Synchronous Edge Detection:** The design safely detects the falling edge of the user `START` button by using a 2-stage shift register, completely avoiding unsafe asynchronous `negedge` triggers in the main sequential logic.
* **Protocol Framing:** The logic automatically constructs the mandatory 14-bit transmission frame from the 13-bit input by dynamically injecting a `NULL` (0) bit between the `T` and `N` configuration fields.
