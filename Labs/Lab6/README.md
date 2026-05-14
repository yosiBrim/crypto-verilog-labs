# Lab 6: DES Algorithm Verification Environment

## 👥 Authors
* **Yosi Brim**
* **Elad**

## 📄 Overview
This project implements a professional verification environment for the **Data Encryption Standard (DES)** algorithm. The focus is on hardware verification methodologies, specifically automated file-based testing.

## 🧠 Key Concepts
* **Self-Checking Testbench:** Automated comparison between DUT output and golden vectors.
* **File I/O:** Dynamic reading of test vectors using `$fscanf`.
* **Stub Interface:** Implementation of a hardware stub to emulate the DES encryption core.

## 📁 Structure
* `/rtl`: Core interface logic (`stub.v`).
* `/tb`: Verification environment.
* `/test_vectors`: Input and expected results data.
* `/docs`: Project reports and requirements.
