
`timescale 1ns / 1ps

module tb_alu_8bit;

reg [7:0] InputA;
reg [7:0] InputB;
reg [2:0] OpCode;

wire [15:0] OutALU;
wire COut;

// Instantiate ALU
bit_alu uut (
    .InputA(InputA),
    .InputB(InputB),
    .OpCode(OpCode),
    .OutALU(OutALU),
    .COut(COut)
);

initial begin

    $display("8-bit ALU Simulation Started");
    $display("----------------------------");

    // Test Case 1
    InputA = 8'd45;
    InputB = 8'd38;

    OpCode = 3'b000;
    #10;
    $display("ADD: Result=%d Carry=%b", OutALU, COut);

    OpCode = 3'b001;
    #10;
    $display("SUB: Result=%d Carry=%b", OutALU, COut);

    OpCode = 3'b110;
    #10;
    $display("OR: Result=%d Carry=%b", OutALU, COut);

    OpCode = 3'b111;
    #10;
    $display("XOR: Result=%d Carry=%b", OutALU, COut);

    // Test Case 2
    InputA = 8'd49;
    InputB = 8'd10;

    OpCode = 3'b010;
    #10;
    $display("MUL: Result=%d Carry=%b", OutALU, COut);

    OpCode = 3'b011;
    #10;
    $display("LEFT SHIFT: Result=%d", OutALU);

    OpCode = 3'b100;
    #10;
    $display("RIGHT SHIFT: Result=%d", OutALU);

    OpCode = 3'b101;
    #10;
    $display("AND: Result=%d", OutALU);

    $display("----------------------------");
    $display("Simulation Completed");

    $finish;
end

endmodule

