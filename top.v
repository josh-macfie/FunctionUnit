`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:37 07/11/2020 
// Design Name: 
// Module Name:    top 
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
module top(
	uclk,
	btn,
	LED
	);

parameter word_Size = 32;
parameter count_Size = 5;

parameter in_A = 3;  //A = 32'b00000000000000000000000000000000;
parameter in_B = 2;  //B = 32'b00000000000000000000000000000000;

	 input uclk;
	 input btn;
    output [7:0] LED;

/////////////////////////////////////////////////////	
//FS = {MF, S[2:0],Cin}
//G  = FS[3:0] = {S[2:0], Cin}
//H  = FS[3:2] =  S[2:1]
//
//
//On FS
//00000 = A;
//00001 : A + 1;
//00010 = A + B;
//00011 = A + B + 1;
//00100 = A + ~B;
//00101 = A - B;
//00110 = A - 1;
//00111 = A;
//
//0100x = A & B;
//0101x = A | B;
//0110x = A ^ B;
//0111x = ~A;
//
//100xx = B
//101xx = B Left Shift
//110xx = B Right Shift
//111xx = x
//////////////////////////////////////////////////

//need top 5 digits of counter
reg [count_Size-1:0] counter = 0;
reg [6:0] db_btn = 0;
reg old_btn = 0;

wire [word_Size-1:0] A = in_A;
wire [word_Size-1:0] B = in_B;
reg  [4:0] SH = 2;
wire [4:0] FS = counter[count_Size-1:count_Size-5];
wire [word_Size - 1:0] F;
wire V;
wire C;
wire N;
wire Z;

wire enA;

FunctionUnitHW2 #(.word_Size(word_Size))
		FU_1(
		.FS(FS[4:0]),
		.A(A[word_Size - 1:0]),
		.B(B[word_Size - 1:0]),
		.SH(SH[4:0]),
		.F(F[word_Size - 1:0]),
		.V(V),
		.C(C),
		.N(N),
		.Z(Z)
		);

always @(posedge uclk)
begin
	old_btn <= &db_btn;
end

always @(posedge uclk)
begin
	db_btn <= db_btn << 1;
	db_btn[0] <= btn;
end

always @(posedge uclk)
begin
	if(enA) begin
		counter <= counter + 1;
	end

end

assign enA = &db_btn && ~old_btn;

assign LED[3:0] = F[3:0];
assign LED[4] = V;
assign LED[5] = C;
assign LED[6] = N;
assign LED[7] = Z;

endmodule
