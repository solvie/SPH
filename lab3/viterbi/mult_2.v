module mult_2 (a, out);
input signed [7:0] a;
output reg signed [7:0] out;

reg signed [7:0] a_reg;

wire signed [7:0]	mult_out;

assign mult_out = a_reg * 2;

always@(*)
begin
	a_reg <= a;
	out <= mult_out;
end
endmodule

module mult_m2 (a, out);
input signed [7:0] a;
output reg signed [7:0] out;

reg signed [7:0] a_reg;

wire signed [7:0]	mult_out;


assign mult_out = a_reg * (-2);

always@(*)
begin
	a_reg <= a;
	out <= mult_out;
end

endmodule