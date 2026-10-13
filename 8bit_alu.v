module bit_alu(
    input [7:0] InputA,
    input [7:0] InputB,
    input [2:0] OpCode,
    output reg [15:0] OutALU,
    output reg COut
     );
     reg [8:0] temp;

always @(*) begin
    OutALU = 16'd0;
    COut = 1'b0;
    temp = 9'd0;

    case (OpCode)
        3'b000: begin
            temp = {1'b0, InputA} + {1'b0, InputB};
            OutALU = {7'b0, temp};
            COut = temp[8];
        end

        3'b001: begin
            OutALU = {8'b0, InputA} - {8'b0, InputB};
        end

        3'b010: OutALU = InputA * InputB;

        3'b011: OutALU = {8'b0, InputA} << 1;

        3'b100: OutALU = {8'b0, InputA} >> 1;

        3'b101: OutALU = {8'b0, (InputA & InputB)};

        3'b110: OutALU = {8'b0, (InputA | InputB)};

        3'b111: OutALU = {8'b0, (InputA ^ InputB)};

        default: begin
            OutALU = 16'd0;
            COut = 1'b0;
        end
    endcase
end


endmodule
