

module HEX_DISPLAY(HEX0, SW);	//directly uses keywords to utilize the switches and the HEX display on the FGBA board 
																//to avoid assigning other variables
	input [3:0]SW;
	output [6:0]HEX0;
	
	//checks which combinations require of each HEX display segment (0-6) to light up; this allows you to use 7 equations
	//an alternative is creating 16 cases in which you would explictly define [6:0]HEX0
	assign HEX0[0] = (~SW[3]&~SW[2]&~SW[1]&SW[0])|(~SW[3]&SW[2]&~SW[1]&~SW[0])|(SW[3]&~SW[2]&SW[1]&SW[0])|(SW[3]&SW[2]&~SW[1]&~SW[0])|(SW[3]&SW[2]&~SW[1]&SW[0]);
	assign HEX0[1] = (~SW[3]&SW[2]&~SW[1]&SW[0])|(~SW[3]&SW[2]&SW[1]&~SW[0])|(SW[3]&~SW[2]&SW[1]&SW[0])|(SW[3]&SW[2]&~SW[1]&~SW[0])|(SW[3]&SW[2]&SW[1]&SW[0]);
	assign HEX0[2] = (~SW[3]&~SW[2]&SW[1]&~SW[0])|(SW[3]&SW[2]&~SW[1]&~SW[0])|(SW[3]&SW[2]&SW[1]&~SW[0])|(SW[3]&SW[2]&SW[1]&SW[0]);
	assign HEX0[3] = (~SW[3]&~SW[2]&~SW[1]&SW[0])|(~SW[3]&SW[2]&~SW[1]&~SW[0])|(~SW[3]&SW[2]&SW[1]&SW[0])|(SW[3]&~SW[2]&~SW[1]&SW[0])|(SW[3]&~SW[2]&SW[1]&~SW[0])|(SW[3]&SW[2]&SW[1]&SW[0]);
	assign HEX0[4] = (~SW[3]&~SW[2]&~SW[1]&SW[0])|(~SW[3]&~SW[2]&SW[1]&SW[0])|(~SW[3]&SW[2]&~SW[1]&~SW[0])|(~SW[3]&SW[2]&~SW[1]&SW[0])|(~SW[3]&SW[2]&SW[1]&SW[0])|(SW[3]&~SW[2]&~SW[1]&SW[0]);
	assign HEX0[5] = (~SW[3]&~SW[2]&~SW[1]&SW[0])|(~SW[3]&~SW[2]&SW[1]&~SW[0])|(~SW[3]&~SW[2]&SW[1]&SW[0])|(~SW[3]&SW[2]&SW[1]&SW[0])|(SW[3]&SW[2]&~SW[1]&~SW[0])|(SW[3]&SW[2]&~SW[1]&SW[0]);
	assign HEX0[6] = (~SW[3]&~SW[2]&~SW[1]&~SW[0])|(~SW[3]&~SW[2]&~SW[1]&SW[0])|(~SW[3]&SW[2]&SW[1]&SW[0]);
	
endmodule
	
