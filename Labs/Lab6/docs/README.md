# Documentation Directory

This folder contains the formal documentation and assignment requirements for Lab 6.

## 📁 Files
* **verilog_lab6.pdf**: The final engineering report submitted for the lab. Includes detailed analysis of the verification methodology, simulation results, and error injection testing.
* **Ex06-Testing_an_Algorithm.pdf**: The original lab instructions and specifications provided by the Jerusalem College of Technology (JCT).

## 📊 Verification Evidence
The verification process involved processing 10 NESSIE test vectors for the DES algorithm. The testbench was designed to automate the comparison between the Stub's output and the golden vectors.

### Simulation Output Example:
All vectors resulted in a **PASS** status. The testbench successfully caught intentional errors when the input files were corrupted for testing purposes, proving the robustness of the self-checking mechanism.
