`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:35 02/06/2016 
// Design Name: 
// Module Name:    FunctionUnitHW2 
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
module FunctionUnitHW2(
    FS, //FS = {MF, S[2:0],Cin}
    A,
    B,
	 SH,
    F,
    V,
    C,
    N,
    Z,
	 PSR_Write
    );

parameter word_Size = 32;

    input [4:0] FS; //FS = {MF, S[2:0],Cin}
    input [word_Size - 1:0] A;
    input [word_Size - 1:0] B;
	 input [4:0] SH;
    output [word_Size - 1:0] F;
    output V;
    output C;
    output N;
    output Z;
	 output PSR_Write;

wire MF = FS[4];
wire[3:0] G = FS[3:0];
wire[1:0] H = FS[3:2];
wire[word_Size - 1:0] ALU_Result;
wire[word_Size - 1:0] S_Result;

Arithmetic_Logic_Unit #(.word_Size(word_Size))
		ALU_1(
		.G(G[3:0]),
		.A(A[word_Size - 1:0]),
		.B(B[word_Size - 1:0]),
		.ALU_Result(ALU_Result[word_Size - 1:0]),
		.V(V),
		.C(C)						);

Shifter #(.word_Size(word_Size))
		Shift_1(								
		.H(H[1:0]),
		.B(B[word_Size - 1:0]),
		.SH(SH[4:0]),
		.S_Result(S_Result[word_Size - 1:0])	);

assign N = ALU_Result[word_Size - 1];
assign Z = ~|ALU_Result;
assign F =  (MF == 1'b0) ? ALU_Result:
				(MF == 1'b1) ? S_Result  : {word_Size{1'bx}};

endmodule
