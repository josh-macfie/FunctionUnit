`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:31:56 02/06/2016
// Design Name:   Arithmetic_Logic_Unit
// Module Name:   /home/joshua/Desktop/ISE Projects/HW2MicroArch/MacFieHW2/Arithmatic_Logic_Unit_tb.v
// Project Name:  MacFieHW2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Arithmetic_Logic_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Arithmatic_Logic_Unit_tb;

	// Inputs
	reg [3:0] G;
	reg [7:0] A;
	reg [7:0] B;

	// Outputs
	wire [7:0] ALU_Result;
	wire V;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	Arithmetic_Logic_Unit uut (
		.G(G), 
		.A(A), 
		.B(B), 
		.ALU_Result(ALU_Result), 
		.V(V), 
		.C(C)
	);

		integer i;
		integer j;
		reg [7:0] test;
		reg tC, tV;
		reg errorR, errorC, errorV;

	initial begin
		// Initialize Inputs
		G = 0;
		A = 0;
		B = 0;
		// Wait 100 ns for global reset to finish
		#10;

				assign errorR = (ALU_Result == test) ? 1'b1 : 1'bx;
				assign errorV = (tV == V) ? 1'b1 : 1'bx;
				assign errorC = (tC == C) ? 1'b1 : 1'bx;

		for( i = 0; i < 8; i = i+1 ) begin
			G = i;
			for( j = 0; j < 5; j = j+1) begin
				case(j)
					0: begin A = 8'b00001010 ;B = 8'b00001010;
							case(G)
								0: begin test = A;		 tC = 0; tV = 0; end //Pass A through
								1: begin test = A+1;		 tC = 0; tV = 0; end //A+1
								2: begin test = A+B;		 tC = 0; tV = 0; end //A+B
								3: begin test = A+B+1;	 tC = 0; tV = 0; end //A+B+1
								4: begin test = 255;		 tC = 0; tV = 0; end //A+~B
								5: begin test = A+(~B)+1;tC = 1; tV = 0; end //A-B
								6: begin test = 9;		 tC = 1; tV = 0; end //A-1
								7: begin test = A;		 tC = 0; tV = 0; end //Pass A through
							endcase
						end
					1: begin A = 8'b11111111 ;B = 8'b00001010;
							case(G)
								0: begin test = A;		 tC = 0; tV = 0; end //Pass A through
								1: begin test = A+1;		 tC = 1; tV = 0; end //A+1
								2: begin test = A+B;		 tC = 1; tV = 0; end //A+B
								3: begin test = A+B+1;	 tC = 1; tV = 0; end //A+B+1
								4: begin test = 244;		 tC = 1; tV = 0; end //A+~B
								5: begin test = A+(~B)+1;tC = 1; tV = 0; end //A-B
								6: begin test = 254;		 tC = 1; tV = 0; end //A-1
								7: begin test = A;		 tC = 0; tV = 0; end //Pass A through
							endcase						
						end
					2: begin A = 8'b00001010 ;B = 8'b11111111;
							case(G)
								0: begin test = A;		 tC = 0; tV = 0; end //Pass A through
								1: begin test = A+1;		 tC = 0; tV = 0; end //A+1
								2: begin test = A+B;		 tC = 1; tV = 0; end //A+B
								3: begin test = A+B+1;	 tC = 1; tV = 0; end //A+B+1
								4: begin test = 10;		 tC = 0; tV = 0; end //A+~B
								5: begin test = A+(~B)+1;tC = 0; tV = 0; end //A-B
								6: begin test = 9;		 tC = 1; tV = 0; end //A-1
								7: begin test = A;		 tC = 0; tV = 0; end //Pass A through
							endcase					
						end
					3: begin A = 8'b11111111 ;B = 8'b11111111;
							case(G)
								0: begin test = A;		 tC = 0; tV = 0; end //Pass A through
								1: begin test = A+1;		 tC = 1; tV = 0; end //A+1
								2: begin test = A+B;		 tC = 1; tV = 0; end //A+B
								3: begin test = A+B+1;	 tC = 1; tV = 0; end //A+B+1
								4: begin test = 255;		 tC = 0; tV = 0; end //A+~B
								5: begin test = A+(~B)+1;tC = 1; tV = 0; end //A-B
								6: begin test = 254;		 tC = 1; tV = 0; end //A-1
								7: begin test = A;		 tC = 0; tV = 0; end //Pass A through					
							endcase
						end
					4: begin A = 8'b10000000 ;B = 8'b10000000;
							case(G)
								0: begin test = A;		 tC = 0; tV = 0; end //Pass A through
								1: begin test = A+1;		 tC = 0; tV = 0; end //A+1
								2: begin test = A+B;		 tC = 1; tV = 1; end //A+B
								3: begin test = A+B+1;	 tC = 1; tV = 1; end //A+B+1
								4: begin test = 255;		 tC = 0; tV = 0; end //A+~B
								5: begin test = A+(~B)+1;tC = 1; tV = 1; end //A-B
								6: begin test = 127;		 tC = 1; tV = 1; end //A-1
								7: begin test = A;		 tC = 0; tV = 0; end //Pass A through					
							endcase
						end
					5: begin A = 01111111 ;B = 01111111;
							case(G)
								0: begin test = A;		 tC = 0; tV = 0; end //Pass A through
								1: begin test = A+1;		 tC = 0; tV = 1; end //A+1
								2: begin test = A+B;		 tC = 0; tV = 1; end //A+B
								3: begin test = A+B+1;	 tC = 1; tV = 0; end //A+B+1
								4: begin test = 255;		 tC = 0; tV = 0; end //A+~B
								5: begin test = A+(~B)+1;tC = 1; tV = 0; end //A-B
								6: begin test = 126;		 tC = 1; tV = 0; end //A-1
								7: begin test = A;		 tC = 0; tV = 0; end //Pass A through					
							endcase
						end
//					6: begin A = 10 ;B = 10; end
//					7: begin A = 10 ;B = 10; end
//					8: begin A = 10 ;B = 10; end

				endcase
				#10;
			end
		end

		
		
		for( i = 8; i < 15; i = i + 2 ) begin
			G = i;
			for( j = 0; j < 4; j = j+1) begin
				case(j)
					0: begin A = 8'b00001010 ;B = 8'b00001010;
							case(G)
								8 : begin test = 8'b00001010;	tC = 0; tV = 0; end //A AND B
								10: begin test = 8'b00001010;	tC = 0; tV = 0; end //A OR  B
								12: begin test = 8'b00000000;	tC = 0; tV = 0; end //A XOR B
								14: begin test = 8'b11110101;	tC = 0; tV = 0; end //NOT A
							endcase
						end
					1: begin A = 8'b11111111 ;B = 8'b00001010;
							case(G)
								8 : begin test = 8'b00001010;	tC = 0; tV = 0; end //A AND B
								10: begin test = 8'b11111111;	tC = 0; tV = 0; end //A OR  B
								12: begin test = 8'b11110101;	tC = 0; tV = 0; end //A XOR B
								14: begin test = 8'b00000000;	tC = 0; tV = 0; end //NOT A
							endcase						
						end
					2: begin A = 8'b00001010 ;B = 8'b11111111;
							case(G)
								8 : begin test = 8'b00001010;	tC = 0; tV = 0; end //A AND B
								10: begin test = 8'b11111111;	tC = 0; tV = 0; end //A OR  B
								12: begin test = 8'b11110101;	tC = 0; tV = 0; end //A XOR B
								14: begin test = 8'b11110101;	tC = 0; tV = 0; end //NOT A
							endcase					
						end
					3: begin A = 8'b11111111 ;B = 8'b11111111;
							case(G)
								8 : begin test = 8'b11111111;	tC = 0; tV = 0; end //A AND B
								10: begin test = 8'b11111111;	tC = 0; tV = 0; end //A OR  B
								12: begin test = 8'b00000000;	tC = 0; tV = 0; end //A XOR B
								14: begin test = 8'b00000000;	tC = 0; tV = 0; end //NOT A					
							endcase
							
						end

				endcase
				#10;
			end
		end
		// Add stimulus here
	end
      
endmodule

