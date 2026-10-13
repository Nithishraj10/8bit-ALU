
`timescale 1ns / 1ps

module tb_bit_alu_verified;

reg [7:0] InputA;
reg [7:0] InputB;
reg [2:0] OpCode;

wire [15:0] OutALU;
wire COut;

integer pass_count;
integer fail_count;

// Design Under Test
bit_alu uut (
    .InputA(InputA),
    .InputB(InputB),
    .OpCode(OpCode),
    .OutALU(OutALU),
    .COut(COut)
);

// Automatic verification task
task check_alu;
    input [7:0] a;
    input [7:0] b;
    input [2:0] op;
    input [15:0] expected_result;
    input expected_carry;

    begin
        InputA = a;
        InputB = b;
        OpCode = op;

        #10;

        if ((OutALU === expected_result) &&
            (COut === expected_carry)) begin

            $display("PASS: A=%d B=%d OP=%b OUT=%d C=%b",
                     a, b, op, OutALU, COut);
            pass_count = pass_count + 1;

        end else begin

            $display("FAIL: A=%d B=%d OP=%b", a, b, op);
            $display("Expected: OUT=%d C=%b",
                     expected_result, expected_carry);
            $display("Actual:   OUT=%d C=%b",
                     OutALU, COut);

            fail_count = fail_count + 1;
        end
    end
endtask

initial begin
    pass_count = 0;
    fail_count = 0;

    InputA = 0;
    InputB = 0;
    OpCode = 0;

    $display("===== REFINED ALU VERIFICATION =====");

    // Mandatory Test Case 1
    check_alu(45, 38, 3'b000, 83, 0);
    check_alu(45, 38, 3'b001, 7, 0);
    check_alu(45, 38, 3'b110, 47, 0);
    check_alu(45, 38, 3'b111, 11, 0);

    // Mandatory Test Case 2
    check_alu(49, 10, 3'b010, 490, 0);
    check_alu(49, 10, 3'b011, 98, 0);
    check_alu(49, 10, 3'b100, 24, 0);
    check_alu(49, 10, 3'b101, 0, 0);

    // Additional Edge Cases

    // Addition overflow
    check_alu(255, 1, 3'b000, 256, 1);

    // Zero input
    check_alu(0, 0, 3'b000, 0, 0);

    // Maximum multiplication
    check_alu(255, 255, 3'b010, 65025, 0);

    // Subtraction underflow (16-bit result)
    check_alu(10, 20, 3'b001, 16'hFFF6, 0);

    // Maximum AND
    check_alu(255, 255, 3'b101, 255, 0);

    // Maximum OR
    check_alu(255, 0, 3'b110, 255, 0);

    // Same input XOR
    check_alu(100, 100, 3'b111, 0, 0);

    $display("================================");
    $display("TOTAL TESTS  = %0d",
             pass_count + fail_count);
    $display("PASSED TESTS = %0d", pass_count);
    $display("FAILED TESTS = %0d", fail_count);
    $display("================================");

    if (fail_count == 0)
        $display("ALL TEST CASES PASSED");
    else
        $display("VERIFICATION FAILED");

    $finish;
end

endmodule
