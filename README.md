# 8bit-ALU
# 8-bit ALU Design with AI-Assisted Testbench Generation

### Verilog HDL | Xilinx Vivado 2024.2 | RTL Design & Functional Verification

## Project Overview

This project focuses on the design and functional verification of an **8-bit Arithmetic Logic Unit (ALU)** using Verilog HDL. The ALU supports eight arithmetic and logical operations selected through a 3-bit opcode.

The project integrates **AI-assisted testbench generation and prompt refinement** to improve verification coverage, automate result checking, and validate RTL functionality using Xilinx Vivado 2024.2.

The final testbench successfully passed **15 out of 15 test cases**, including mandatory operations, arithmetic overflow, and boundary conditions.

## Tools and Technologies

- **HDL:** Verilog
- **EDA Tool:** Xilinx Vivado 2024.2
- **Simulator:** Vivado XSim
- **Verification:** AI-Assisted Testbench Generation
- **Design Methodology:** RTL Design and Behavioral Simulation

## ALU Specifications

| Parameter | Description |
|---|---|
| InputA | 8-bit operand |
| InputB | 8-bit operand |
| OpCode | 3-bit operation selector |
| OutALU | 16-bit result |
| COut | Carry-out flag |
| Operations | 8 |
| Design Type | Combinational |

## Supported Operations

| Opcode | Operation |
|---|---|
| 000 | Addition |
| 001 | Subtraction |
| 010 | Multiplication |
| 011 | Left Shift |
| 100 | Right Shift |
| 101 | Bitwise AND |
| 110 | Bitwise OR |
| 111 | Bitwise XOR |

Left and right shifts are performed by one bit. The carry-out flag indicates overflow beyond 8 bits during addition. Negative subtraction results are represented using 16-bit two's-complement format.

## Design Architecture

The ALU is implemented using a combinational `always @(*)` block and a `case` statement for opcode-based operation selection.

**Inputs:** `InputA[7:0]`, `InputB[7:0]`, `OpCode[2:0]`

**Outputs:** `OutALU[15:0]`, `COut`

The 16-bit output accommodates multiplication results and arithmetic operations without restricting the result to eight bits.

## AI-Assisted Verification Methodology

### Phase 1: Initial AI-Generated Testbench

An AI-generated Verilog testbench was developed to verify the eight mandatory ALU operations.

- Applied predefined input combinations
- Verified all eight opcodes
- Used 10 ns simulation intervals
- Displayed outputs using `$display`

**Result:** All 8 mandatory test cases produced correct outputs.

### Phase 2: Refined Testbench

The initial AI prompt was refined to improve verification coverage and automate output validation.

Enhancements included:

- Reusable verification task
- Automatic PASS/FAIL checking
- Expected-versus-actual output comparison
- Addition carry overflow verification
- Zero-input and maximum-value testing
- Subtraction underflow verification
- Automated test summary

### Phase 3: Final Validation

The refined testbench was executed using Vivado XSim.

| Verification Metric | Result |
|---|---|
| Total Test Cases | 15 |
| Passed | 15 |
| Failed | 0 |
| Pass Rate | 100% |
| Simulation Duration | 150 ns |

**Final Result: ALL TEST CASES PASSED**

## Functional Verification Results

| InputA | InputB | Operation | Output |
|---|---|---|---|
| 45 | 38 | Addition | 83 |
| 45 | 38 | Subtraction | 7 |
| 45 | 38 | OR | 47 |
| 45 | 38 | XOR | 11 |
| 49 | 10 | Multiplication | 490 |
| 49 | 10 | Left Shift | 98 |
| 49 | 10 | Right Shift | 24 |
| 49 | 10 | AND | 0 |
| 255 | 1 | Addition Overflow | 256 |
| 0 | 0 | Addition | 0 |
| 255 | 255 | Multiplication | 65025 |
| 10 | 20 | Subtraction | 65526 |

For addition overflow (`255 + 1`), `COut = 1`. The subtraction result `65526` represents −10 in 16-bit two's-complement format.

## Testbench Comparison

| Feature | Initial Testbench | Refined Testbench |
|---|---|---|
| Test Cases | 8 | 15 |
| Automatic PASS/FAIL | No | Yes |
| Edge Case Verification | No | Yes |
| Carry Overflow Checking | No | Yes |
| Automated Summary | No | Yes |
| Simulation Duration | 80 ns | 150 ns |

## How to Run the Project

1. Open Xilinx Vivado 2024.2.
2. Create a new RTL project.
3. Add `8bit_alu.v` as a design source.
4. Add `tb_bit_alu.v` and `tb_bit_alu_verified.v` as simulation sources.
5. Set `tb_bit_alu_verified` as the simulation top module.
6. Select **Run Simulation → Run Behavioral Simulation**.
7. Observe the waveform and PASS/FAIL results in the Tcl Console.

## Key Learning Outcomes

- Developed synthesizable combinational RTL using Verilog HDL.
- Implemented opcode-based arithmetic and logical operations.
- Understood output-width handling and carry generation.
- Developed AI-assisted verification testbenches.
- Improved test coverage through structured prompt refinement.
- Implemented automated functional verification using reusable Verilog tasks.
- Analyzed simulation waveforms and validated boundary conditions.

## Conclusion

The 8-bit ALU was successfully designed and functionally verified using Verilog HDL and Xilinx Vivado 2024.2. The AI-assisted verification workflow demonstrated how structured prompt refinement can improve testbench quality and verification coverage.

All 15 test cases passed successfully, validating the ALU's functionality for the tested operations and boundary conditions.

---

**Project Domain:** VLSI Design | RTL Design | Digital Design Verification

**Author:** Nithish Raj S G
