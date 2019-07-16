`timescale 1ns / 1ns 

module mux2_to_1(SW[0], SW[1], SW[9], LEDR[0]);
	input [9:0]SW;
	output [9:0]LEDR;
	
	//using logic gate structure to imitate a multiplexer
	//uses one NOT gate, two AND gates, one OR gate; by calling other modules
	wire w1, w2, w3;
	NOT u1(.pin1(SW[9]),.pin2(w1));
	AND2 u2(.pin1(SW[0]), .pin2(w1), .pin3(w2));
	AND2 u3(.pin4(SW[9]), .pin5(SW[1]), .pin6(w3));
	OR2 u4(.pin1(w2), .pin2(w3), .pin3(LEDR[0]));

endmodule
	
//QUAD 2-input AND chip
module AND2(pin1, pin2, pin3, pin4, pin5, pin6, pin8, pin9, pin10, pin11, pin12, pin13);
	input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13;
	output pin3, pin6, pin8, pin11;

	assign pin3 = pin1 & pin2;
	assign pin6 = pin4 & pin5;
	assign pin8 = pin9 & pin10;
	assign pin11= pin12 & pin13;

endmodule

//QUAD 2-input OR chip
module OR2(pin1, pin2, pin3, pin4, pin5, pin6, pin8, pin9, pin10, pin11, pin12, pin13);
	input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13;
	output pin3, pin6, pin8, pin11;
	
	assign pin3 = pin1 | pin2;
	assign pin6 = pin4 | pin5;
	assign pin8 = pin9 | pin10;
	assign pin11= pin12 | pin13;

endmodule

//HEX NOT chip
module NOT(pin1, pin2, pin3, pin4, pin5, pin6, pin8, pin9, pin10, pin11, pin12, pin13);
	input pin1, pin3, pin5, pin9, pin11, pin13;
	output pin2, pin4, pin6, pin8, pin10, pin12;
	
	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin8 = ~pin9;
	assign pin10= ~pin11;
	assign pin12= ~pin12;

endmodule 