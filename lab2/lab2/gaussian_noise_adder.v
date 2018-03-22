module gaussian_noise_40db (Y, clk, Y_hat, noise, reset);
input	reg	[31:0]	Y;	
input  reg clk, reset;
output reg [31:0]  	Y_hat, noise;
reg [31:0] noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0F0F0F0F;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (reset), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed+15) , .RST (reset), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed+8) , .RST (reset), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed+12) , .RST (reset), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed+50) , .RST (reset), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed+47) , .RST (reset), .CLK (clk), .Y (noise6));

always@(*)	 begin

	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{10'h00000000}, {noise[31:10]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_30db (Y, clk, Y_hat, noise, reset);
input	reg	[31:0]	Y;	
input  reg clk, reset;
output reg [31:0]  	Y_hat, noise;
reg [31:0] noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0FEFBF0F;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (reset), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed+15) , .RST (reset), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed+8) , .RST (reset), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed+12) , .RST (reset), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed+50) , .RST (reset), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed+47) , .RST (reset), .CLK (clk), .Y (noise6));

always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{8'b00000000}, {noise[31:8]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_20db (Y, clk, Y_hat, noise, reset);
input	reg	[31:0]	Y;	
input  reg clk, reset;
output reg [31:0]  	Y_hat, noise;
reg [31:0] noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0AEFBA0F;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (reset), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed+15) , .RST (reset), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed+8) , .RST (reset), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed+12) , .RST (reset), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed+50) , .RST (reset), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed+47) , .RST (reset), .CLK (clk), .Y (noise6));

always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{6'h00000000}, {noise[31:6]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_10db (Y, clk, Y_hat, noise, reset);
input	reg	[31:0]	Y;	
input reg  clk, reset;
output reg [31:0]  	Y_hat, noise;
reg [31:0] noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0AEF6A04;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (reset), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed+15) , .RST (reset), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed+8) , .RST (reset), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed+12) , .RST (reset), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed+50) , .RST (reset), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed+47) , .RST (reset), .CLK (clk), .Y (noise6));
always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{4'h00000000}, {noise[31:4]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_0db (Y, clk, Y_hat, noise, reset);
input	reg	[31:0]	Y;	
input  reg clk, reset;
output reg [31:0]  	Y_hat, noise;
reg [31:0] noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0A2F6204;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (reset), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed+15) , .RST (reset), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed+8) , .RST (reset), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed+12) , .RST (reset), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed+50) , .RST (reset), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed+47) , .RST (reset), .CLK (clk), .Y (noise6));
always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{2'h00000000}, {noise[31:2]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_m10db (Y, clk, Y_hat, noise, reset);
input	reg	[31:0]	Y;	
input  reg clk, reset;
output reg [31:0]  	Y_hat, noise;
reg [31:0] noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0112C6204;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (reset), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed+15) , .RST (reset), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed+8) , .RST (reset), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed+12) , .RST (reset), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed+50) , .RST (reset), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed+47) , .RST (reset), .CLK (clk), .Y (noise6));

always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= noise^Y; //possibly neeed to mod
end
endmodule

