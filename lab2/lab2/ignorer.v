module ignorer(select, out);
input	reg	[2:0]	select;	
output reg  	out;

always@(*)	 begin
out <= select[0];
end
endmodule
