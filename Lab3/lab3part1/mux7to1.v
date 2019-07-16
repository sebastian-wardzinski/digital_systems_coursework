

module mux7_to_1(SW, LEDR);
	input [9:0]SW;					// input switches	[6:0], select switches [9:7]
	output reg [0:0]LEDR;
	
	always@(*) 
	
	begin
		
		case(SW[9:7])
			
			3'b000: LEDR = SW[0]; //case 0/6
			3'b001: LEDR = SW[1]; //case 1/6
			3'b010: LEDR = SW[2]; //case 2/6
			3'b011: LEDR = SW[3]; //case 3/6
			3'b100: LEDR = SW[4]; //case 4/6
			3'b101: LEDR = SW[5]; //case 5/6
			3'b110: LEDR = SW[6]; //case 6/6
		
			default: LEDR = 0;
			
		endcase
	
	end
	
endmodule
	 