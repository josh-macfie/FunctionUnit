`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:41 02/06/2016 
// Design Name: 
// Module Name:    Arithmatic_Logic_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Arithmetic_Logic_Unit(
    G,
    A,
    B,
    ALU_Result,
    V,
    C,
	 PSR_Write
    );

parameter word_Size = 32;

    input [3:0] G;
    input [word_Size - 1:0] A;
    input [word_Size - 1:0] B;
    output reg [word_Size - 1:0] ALU_Result;
    output V;
    output reg C;
	 output reg PSR_Write;

reg [word_Size - 1:0] Inner_Carry;
wire[word_Size - 1:0] nB = ~B;
wire[word_Size - 1:0] nBplusOne = nB + 1;
wire[word_Size - 1:0] negOne = 8'b11111111; //0000|0001, 1111|1110, 11111111

always @ (*) begin
	casex(G)
		4'b0000 : Inner_Carry =  A[word_Size - 2:0];
		4'b0001 : Inner_Carry = (A[word_Size - 2:0] + 1);
		4'b0010 : Inner_Carry = (A[word_Size - 2:0] + B[word_Size - 2:0]);
		4'b0011 : Inner_Carry = (A[word_Size - 2:0] + B[word_Size - 2:0] + 1);
		4'b0100 : Inner_Carry = (A[word_Size - 2:0] + (nB[word_Size - 2:0]));
		4'b0101 : Inner_Carry = (A[word_Size - 2:0] + nBplusOne[word_Size - 2:0]);
		4'b0110 : Inner_Carry = (A[word_Size - 2:0] + negOne[word_Size - 2:0]);
		4'b0111 : Inner_Carry =  A[word_Size - 2:0];

		4'b100x : Inner_Carry = ( A[word_Size - 2:0] & B[word_Size - 2:0]);
		4'b101x : Inner_Carry = ( A[word_Size - 2:0] | B[word_Size - 2:0]);
		4'b110x : Inner_Carry = ( A[word_Size - 2:0] ^ B[word_Size - 2:0]);
		4'b111x : Inner_Carry = (~A[word_Size - 2:0]);
		default : Inner_Carry = {word_Size{1'bx}};
	endcase

	casex(G)
		4'b0000 : begin {C, ALU_Result} =  A;
									PSR_Write = 0;
					 end
		4'b0001 : begin {C, ALU_Result} = (A + 1);
							PSR_Write = 1;
					 end
		4'b0010 : begin {C, ALU_Result} = (A + B);
									PSR_Write = 1;
					 end
		4'b0011 : begin {C, ALU_Result} = (A + B + 1);
									PSR_Write = 1;
					 end

		4'b0100 : begin {C, ALU_Result} = (A + (nB));
									PSR_Write = 1;
					 end

		4'b0101 : begin {C, ALU_Result} = (A + nBplusOne);
									PSR_Write = 1;
					 end

		4'b0110 : begin {C, ALU_Result} = (A + negOne);
									PSR_Write = 1;
					 end

		4'b0111 : begin {C, ALU_Result} = (A);
											PSR_Write = 0;
					 end

		4'b100x : begin {C, ALU_Result} =  A & B;
											PSR_Write = 0;
					 end
		4'b101x : begin {C, ALU_Result} =  A | B;
											PSR_Write = 0;
					 end
		4'b110x : begin {C, ALU_Result} =  A ^ B;
											PSR_Write = 0;
					 end
		4'b111x : begin {C, ALU_Result} = ~A;
											PSR_Write = 0;
					 end
		default : begin {C, ALU_Result} = {word_Size{1'bx}};
											PSR_Write = 0;
					 end
	endcase
end
								
assign V = (C ^ Inner_Carry[7]) ? 1'b1 : 1'b0;

endmodule
