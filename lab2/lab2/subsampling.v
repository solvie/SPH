module subsampling_2_1 (Y,clk, Y_hat);	
input	reg	[31:0]	Y;	
input	reg				clk;	
output reg [31:0]  	Y_hat;
wire out;
reg [31:0] count;

counter count1(.clk(clk), .count(count));

always@(count,clk )	 begin
if (count[0] == 1'b0) begin
	Y_hat <= Y;
	out <= Y;
end else begin
	Y_hat <= out;
end
end
endmodule

module subsampling_4_1 (Y,clk, Y_hat);	
input	reg	[31:0]	Y;	
input	reg				clk;	
output reg [31:0]  	Y_hat;
wire out;
reg [31:0] count;

counter count1(.clk(clk), .count(count));

always@(count, clk)	 begin
if (count[1:0] == 2'b00) begin
	Y_hat <= Y;
	out <= Y;
end else begin
	Y_hat <= out;
end
end
endmodule

module subsampling_8_1 (Y,clk, Y_hat);	
input	reg	[31:0]	Y;	
input	reg				clk;	
output reg [31:0]  	Y_hat;
wire out;
reg [31:0] count;

counter count1(.clk(clk), .count(count));

always@(count, clk)	 begin
if (count[2:0] == 3'b000) begin
	Y_hat <= Y;
	out <= Y;
end else begin
	Y_hat <= out;
end
end
endmodule

module subsampling_16_1 (Y,clk, Y_hat);	
input	reg	[31:0]	Y;	
input	reg				clk;	
output reg [31:0]  	Y_hat;
wire out;
reg [31:0] count;

counter count1(.clk(clk), .count(count));

always@(count, clk)	 begin
if (count[3:0] == 4'b0000) begin
	Y_hat <= Y;
	out <= Y;
end else begin
	Y_hat <= out;
end
end
endmodule