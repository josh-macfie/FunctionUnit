`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:37 02/06/2016 
// Design Name: 
// Module Name:    Shifter 
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
module Shifter(
	 H,
	 B,
	 SH,
    S_Result
    );

parameter word_Size = 32;

input  [1:0] H;
input  [word_Size - 1:0] B;
input  [4:0] SH;
output [word_Size - 1:0] S_Result;

assign S_Result = (H == 2'b00) ? B 		  :
						(H == 2'b01) ? B << SH :
						(H == 2'b10) ? B >> SH : {word_Size{1'bx}};
endmodule
