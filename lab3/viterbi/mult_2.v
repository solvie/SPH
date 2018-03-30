module mult_2 (a, out);
input signed [7:0] a;
output reg signed [7:0] out;

reg signed [7:0] a_reg;

wire signed [15:0]	mult_out;

assign mult_out = a_reg * 2;

always@(*)
begin
   if (mult_out > 16'b0000000011111111)
      begin
			out <= 8'b11111111;
      end
   else
      begin
			out <= mult_out[7:0];
      end
	a_reg <= a;
end
endmodule

module mult_m2 (a, out);
input signed [7:0] a;
output reg signed [7:0] out;

reg signed [7:0] a_reg;

wire signed [15:0]	mult_out;


assign mult_out = a_reg * (-2);

always@(*)
begin
   if (mult_out > 16'b0000000011111111)
      begin
			out <= 8'b11111111;
      end
   else
      begin
			out <= mult_out[7:0];
      end
	a_reg <= a;
end
endmodule