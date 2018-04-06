
module add8(a, b, cin, y, cout);
	input[7:0] a,b;
	input		cin;
	output[7:0] y;
	output cout;
	assign {cout,y} = a + b + cin;
endmodule
