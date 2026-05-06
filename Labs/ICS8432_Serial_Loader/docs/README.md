# Documentation and Supporting Materials

This directory contains all the non-RTL assets that support the design, verification, and formal reporting of the ICS8432 Serial Loader project.

## 📂 Folder Contents

### 1. Specification and Datasheets
* `Quiz-130330-26b-Practical_assignment.pdf`: The original midterm assignment instructions provided by the instructor (Uri Stroh).
* `REN_8432-51_DST_20121218_1.pdf`: The official Renesas/IDT datasheet for the ICS8432-51 Frequency Synthesizer, used for protocol timing and pinout reference.

### 2. Design Diagrams
* `block_diagram.png`: A high-level hardware architectural view showing the relationship between the FSM, the shift register, and the edge detector.
* `state_diagram.png`: The Finite State Machine (FSM) state transition diagram illustrating the `IDLE`, `SHIFT_LOW`, `SHIFT_HIGH`, and `LATCH` logic.

### 3. Final Reports
* `Yosi_Brim_Verilog_Midterm.pdf`: The comprehensive final report submitted for the exam, including LaTeX-formatted code, simulation waveforms, and implementation results.

## 📊 Visual Assets
The diagrams stored in this folder are referenced in the main project `README.md` to provide immediate visual context for the hardware architecture. 

## 🛠 Tools Used
* **LaTeX / Overleaf:** For professional report generation.
* **Vivado ML Edition:** For synthesis, implementation, and post-implementation timing simulation.
* **GitHub:** For version control and portfolio presentation.
