//https://stackoverflow.com/questions/34011576/generating-random-numbers-in-verilog
module uniform_random_num_gen (seed, a);
input integer seed;
output reg signed [31:0] a;

always@(*)	 begin
	a <= { a[31:0], a[31] ^ a[28] };
end
endmodule 