# Cryptography Algorithms and Verilog Implementation (130330)

Welcome to the repository for the **Cryptography Algorithms and Verilog Implementation** course, taught by Uri Stroh. This repository contains course materials, lecture notes, and the complete source code and documentation for the laboratory assignments.

## Course Overview & Objectives
The field of cryptography deals with information security challenges, including encryption, data integrity, authentication, access control, and more[cite: 2]. Cryptographic mechanisms are essential across a wide range of technological systems and products[cite: 2].

This course aims to provide a solid foundation in cryptographic concepts and hands-on experience in implementing these mechanisms in hardware[cite: 2]. 

By the end of the course, students are expected to be able to:
*   Understand and explain the fundamentals of cryptography and information security[cite: 2].
*   Design digital circuits and implement key components of cryptographic algorithms using **Verilog HDL**[cite: 2].
*   Write comprehensive testbenches to verify hardware designs[cite: 2].
*   Perform synthesis and physical implementation (Place & Route) using tools like **ModelSim** and **Vivado**[cite: 2].

## Repository Structure

The repository is organized to map directly to the course syllabus, separating theoretical materials from hands-on laboratory implementations.

*   📂 **Course_Materials/** - Syllabus, lecture notes, and introductory materials.
*   📂 **Labs/** - Laboratory assignments covering Verilog fundamentals and hardware cryptography.
    *   📂 **Lab01_Verilog_Fundamentals**
    *   📂 **Lab02_Sequential_Logic_and_Memories**
    *   📂 **Lab03_Finite_State_Machines** 
    *   📂 **Lab04_Cryptographic_Primitives** 
    *   *... Additional labs will be added as the course progresses.*

### Standard Laboratory Folder Structure
To maintain consistency and professional organization, **every laboratory folder** (e.g., `Lab03_Finite_State_Machines`) contains the following standardized sub-directory structure:

*   `docs/` - Assignment specifications, requirements, and reference documents.
*   `rtl/` - Verilog source code (`.v` / `.sv` files) for the hardware design.
*   `tb/` - Verilog testbenches for functional verification.
*   `sim/` - Simulation waveforms and logs (e.g., from ModelSim)[cite: 1, 4].
*   `synth/` - Synthesis reports, netlists, and logs (e.g., from Precision)[cite: 1, 4].
*   `pnr/` - Place & Route outputs (SDF, Netlists) and gate-level simulation results (e.g., from Vivado)[cite: 1, 4].
*   `report/` - The final laboratory report summarizing the design, implementation, and results.

