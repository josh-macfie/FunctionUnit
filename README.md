# FunctionUnit
Find the video here:</br>
https://youtu.be/ZPaQTN6Xp0c</br>
</p>
This video describes the code used to make a Function Unit out of Verilog with includes tying together an Arithmetic Logic Unit (ALU) and a Shifter. Simulations were done for proof of concept but this series aims to program an FPGA with each part to ultimately build a microprocessor. Follow along as we go. See below for the code and helpful links. Have a great day and don't forget to Love Well!!</p>
</br>
Link to the book this is based out of:</br>
https://www.amazon.com/Logic-Computer-Design-Fundamentals-Updated/dp/B000OIK23I</p>



Walk through and other info:</br>
Video link:</br>
</p>
Linux Commands to program processor:</br>
djtgcfg enum</br>
djtgcfg init -d Basys2</br>
djtgcfg prog -d Basys2 -i 0 -f /<YOUR/FILE/PATH>.bit</br>
</p>
The registers:</br>
A=3; B=2; ~B=13</br>
A=0011; B=0010; ~B=11111111111111111111111111111101  </br>
</p>
The output code (FAR RIGHT)</br>
out ~> ZNCV####</br>
</p>
The codes and their results:</br>
00000 = 	A		= 3  = 00000011</br>
00001 = 	A + 1		= 4  = 00000100</br>
00010 = 	A + B		= 5  = 00000101</br>
00011 = 	A + B + 1	= 6  = 00000110</br>
00100 = 	A + ~B		= 0  = 10110000</br>
00101 = 	A - B		= 1  = 00110001</br>
00110 = 	A - 1		= 2  = 00000010</br>
00111 = 	A		= 3  = 00000011</br>
</br>
01000 = 	A & B		= 2  = 00000010</br>
01001 = 	A & B		= 2  = 00000010</br>
</br>
01010 = 	A | B		= 3  = 00000011</br>
01011 = 	A | B		= 3  = 00000011</br>
</br>
01100 = 	A ^ B		= 1  = 00000001</br>
01101 = 	A ^ B		= 1  = 00000001</br>
</br>
01110 = 	~A		= 12 = 01101100</br>
01111 = 	~A		= 12 = 01101100</br>
</br>
10000 = 	B		= 2  = xxxx0010</br>
10001 = 	B		= 2  = xxxx0010</br>
10010 = 	B		= 2  = xxxx0010</br>
10011 = 	B		= 2  = xxxx0010</br>
</br>
10100 = 	B Left Shift	= 8  = xxxx1000</br>
10101 = 	B Left Shift	= 8  = xxxx1000</br>
10110 = 	B Left Shift	= 8  = xxxx1000</br>
10111 = 	B Left Shift	= 8  = xxxx1000</br>
</br>
11000 = 	B Right Shift	= 0  = xxxx0000</br>
11001 = 	B Right Shift	= 0  = xxxx0000</br>
11010 = 	B Right Shift	= 0  = xxxx0000</br>
11011 = 	B Right Shift	= 0  = xxxx0000</br>
</br>
11100 = 	x		= x  =</br>
11101 = 	x		= x  =</br>
11110 = 	x		= x  =</br>
11111 = 	x		= x  =</br>
