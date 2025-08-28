`timescale 1ns / 1ps

module ALU_tb;
    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] ALU_Sel;

    // Outputs
    wire [7:0] ALU_Out;
    wire CarryOut;
    wire Zero;
    wire Overflow;

    // Instantiate the ALU
    ALU uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut),
        .Zero(Zero),
        .Overflow(Overflow)
    );

    // Testbench Procedure
    initial begin
        // Initialize Inputs
        A = 8'b10101010; // Example input
        B = 8'b01010101; // Example input
        ALU_Sel = 4'b0000; // Default selection

        // Wait for global reset
        #10;

        // Test Addition
        ALU_Sel = 4'b0000; #10;

        // Test Subtraction
        ALU_Sel = 4'b0001; #10;

        // Test AND
        ALU_Sel = 4'b0010; #10;

        // Test OR
        ALU_Sel = 4'b0011; #10;

        // Test XOR
        ALU_Sel = 4'b0100; #10;

        // Test NOR
        ALU_Sel = 4'b0101; #10;

        // Test Shift Left
        ALU_Sel = 4'b0110; #10;

        // Test Shift Right
        ALU_Sel = 4'b0111; #10;

        // Test NAND
        ALU_Sel = 4'b1000; #10;

        // Test XNOR
        ALU_Sel = 4'b1001; #10;

        // Test Less Than
        ALU_Sel = 4'b1010; #10;
        
        // Test Equal To
        ALU_Sel = 4'b1011; #10;
        
        // Test Greater Than
        ALU_Sel = 4'b1100; #10;

        // Test Not Equal To
        ALU_Sel = 4'b1101; #10;
        
        // Test Greater or Equal To
        ALU_Sel = 4'b1110; #10;
        
        // Test Less or Equal To
        ALU_Sel = 4'b1111; #10;
        
        // Finish simulation
        $finish;
    end
endmodule
