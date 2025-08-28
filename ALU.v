`timescale 1ns / 1ps

module ALU(
    input [7:0] A, B,
    input [3:0] ALU_Sel,
    output reg [7:0] ALU_Out,
    output reg CarryOut,
    output reg Zero,
    output reg Overflow
);
    always @(*) begin
        CarryOut = 0;
        Zero = 0;
        Overflow = 0;
        case (ALU_Sel)
            4'b0000: {CarryOut, ALU_Out} = A + B; // Addition
            4'b0001: {CarryOut, ALU_Out} = A - B; // Subtraction
            4'b0010: ALU_Out = A & B;             // AND
            4'b0011: ALU_Out = A | B;             // OR
            4'b0100: ALU_Out = A ^ B;             // XOR
            4'b0101: ALU_Out = ~(A | B);          // NOR
            4'b0110: ALU_Out = A << 1;            // Shift left
            4'b0111: ALU_Out = A >> 1;            // Shift right
            4'b1000: ALU_Out = ~(A & B);          // NAND
            4'b1001: ALU_Out = ~(A ^ B);          // XNOR
            4'b1010: ALU_Out = (A < B) ? 8'b1 : 8'b0; // Less than
            4'b1011: ALU_Out = (A == B) ? 8'b1 : 8'b0; // Equal to
            4'b1100: ALU_Out = (A > B) ? 8'b1 : 8'b0; // Greater than
            4'b1101: ALU_Out = (A != B) ? 8'b1 : 8'b0; // Not equal to
            4'b1110: ALU_Out = (A >= B) ? 8'b1 : 8'b0; // Greater or equal to
            4'b1111: ALU_Out = (A <= B) ? 8'b1 : 8'b0; // Less or equal to
            default: ALU_Out = 8'b00000000;
        endcase

        // Set the Zero flag
        Zero = (ALU_Out == 8'b00000000) ? 1 : 0;

        // Set the Overflow flag for addition and subtraction
        if (ALU_Sel == 4'b0000) // Addition
            Overflow = (A[7] & B[7] & ~ALU_Out[7]) | (~A[7] & ~B[7] & ALU_Out[7]);
        else if (ALU_Sel == 4'b0001) // Subtraction
            Overflow = (A[7] & ~B[7] & ~ALU_Out[7]) | (~A[7] & B[7] & ALU_Out[7]);
    end
endmodule
