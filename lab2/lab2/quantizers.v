module quantizer_16 (Y, Y_hat);	
input	reg	[31:0]	Y;	
output reg [31:0]  Y_hat;
//int Y_dec;

always@(*)	 begin
Y_hat <= {{Y[31:16]},{16'h0000}};
//Y_dec = Y;
//if (Y_dec<= (2**32)/2) begin
//	assign Y_hat= 32'h00000000;
//end else begin
//	assign Y_hat= 32'hFFFFFFFF;
//end
end
endmodule

module quantizer_8 (Y, Y_hat);	
input	reg	[31:0]	Y;	
output reg [31:0]  Y_hat;
//int Y_dec;

always@(*)	 begin
Y_hat <= {{Y[31:24]},{24'h0000}};
//Y_dec = Y;
//if (Y_dec<= (2**32)/2) begin
//	assign Y_hat= 32'h00000000;
//end else begin
//	assign Y_hat= 32'hFFFFFFFF;
//end
end
endmodule

module quantizer_4 (Y, Y_hat);	
input	reg	[31:0]	Y;	
output reg [31:0]  Y_hat;
//int Y_dec;

always@(*)	 begin
Y_hat <= {{Y[31:28]},{28'h0000}};
//Y_dec = Y;
//if (Y_dec<= (2**32)/2) begin
//	assign Y_hat= 32'h00000000;
//end else begin
//	assign Y_hat= 32'hFFFFFFFF;
//end
end
endmodule

module quantizer_3 (Y, Y_hat);	
input	reg	[31:0]	Y;	
output reg [31:0]  Y_hat;
//int Y_dec;

always@(*)	 begin
Y_hat <= {{Y[31:29]},{29'h0000}};
//Y_dec = Y;
//if (Y_dec<= (2**32)/2) begin
//	assign Y_hat= 32'h00000000;
//end else begin
//	assign Y_hat= 32'hFFFFFFFF;
//end
end
endmodule

module quantizer_2 (Y, Y_hat);	
input	reg	[31:0]	Y;	
output reg [31:0]  Y_hat;
//int Y_dec;

always@(*)	 begin
Y_hat <= {{Y[31:30]},{30'h0000}};
//Y_dec = Y;
//if (Y_dec<= (2**32)/2) begin
//	assign Y_hat= 32'h00000000;
//end else begin
//	assign Y_hat= 32'hFFFFFFFF;
//end
end
endmodule

module quantizer_1 (Y, Y_hat);	
input	reg	[31:0]	Y;	
output reg [31:0]  Y_hat;
//int Y_dec;

always@(*)	 begin
Y_hat <= {{Y[31]},{31'h0000}};
//Y_dec = Y;
//if (Y_dec<= (2**32)/2) begin
//	assign Y_hat= 32'h00000000;
//end else begin
//	assign Y_hat= 32'hFFFFFFFF;
//end
end
endmodule