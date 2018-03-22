/****************************************************

converts 1 to 1 represented by [0 0 0 1 0 0 0 0]
converts 0 to -1 represented by [1 0 0 1 0 0 0 0]

****************************************************/


module convert_bit_to_8bit(input_bit, out);
	input input_bit;
	output reg[7:0] out;
	always @(*) begin
	if (input_bit==1) begin
		out <= 8'b00010000;
	end
	else begin
		out <=8'b10010000;
	end
	end
endmodule