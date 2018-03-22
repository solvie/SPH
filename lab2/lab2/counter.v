module counter (clk, count);	
input	reg				clk;	
output reg [31:0]  	count;

always@(posedge clk)	 begin
	count <= count+1;
end
endmodule