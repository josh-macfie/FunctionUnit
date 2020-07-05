`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:51:07 02/09/2016
// Design Name:   Shifter
// Module Name:   /home/joshua/Desktop/ISE Projects/HW2MicroArch/MacFieHW2/Shifter_tb.v
// Project Name:  MacFieHW2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Shifter_tb;

	// Inputs
	reg [1:0] H;
	reg [7:0] B;

	// Outputs
	wire [7:0] S_Result;

	// Instantiate the Unit Under Test (UUT)
	Shifter uut (
		.H(H), 
		.B(B), 
		.S_Result(S_Result)
	);

		reg [7:0] test;
		reg error;
		integer i;
		integer j;

	initial begin
		// Initialize Inputs
		H = 0;
		B = 0;


		// Wait 100 ns for global reset to finish
		#5;
      assign error = (test == S_Result) ? 1'b1 : 1'bx;
		// Add stimulus here
		for( i = 0 ; i < 3; i = i + 1) begin
			H = i;
			for( j = 0 ; j < 3 ; j = j + 1) begin
				case(j)
					0:begin B = 8'b11111111; 
						case(H)
							0: test = 8'b11111111;
							1: test = 8'b01111111;
							2: test = 8'b11111110;
						endcase
					  end
					1:begin B = 8'b01010101;
						case(H)
							0: test = 8'b01010101;
							1: test = 8'b00101010;
							2: test = 8'b10101010;
						endcase
					  end
					2:begin B = 8'b00110011;
						case(H)
							0: test = 8'b00110011;
							1: test = 8'b00011001;
							2: test = 8'b01100110;
						endcase
					  end
				endcase
				#10;
			end
		end
	end
      
endmodule

