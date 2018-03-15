module gaussian_noise_40db (Y, clk, Y_hat, noise);
input	reg	[31:0]	Y;	
input   clk;
output reg [31:0]  	Y_hat, noise;
wire noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0F0F0F0F;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise6));

/* uniform_random_num_gen uniform_random_num_gen_1(.seed(seed), .a(noise1));
uniform_random_num_gen uniform_random_num_gen_2(.seed(seed+1), .a(noise2));
uniform_random_num_gen uniform_random_num_gen_3(.seed(seed+2), .a(noise3));
uniform_random_num_gen uniform_random_num_gen_4(.seed(seed+3), .a(noise4));
uniform_random_num_gen uniform_random_num_gen_5(.seed(seed+4), .a(noise5));
uniform_random_num_gen uniform_random_num_gen_6(.seed(seed+5), .a(noise6));*/

always@(*)	 begin

	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{noise[31]}, {15'h00000000}, {noise[30:16]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_30db (Y, clk, Y_hat, noise);
input	reg	[31:0]	Y;	
input   clk;
output reg [31:0]  	Y_hat, noise;
wire noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0FEFBF0F;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise6));


always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{noise[31]}, {14'h00000000}, {noise[30:15]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_20db (Y, clk, Y_hat, noise);
input	reg	[31:0]	Y;	
input   clk;
output reg [31:0]  	Y_hat, noise;
wire noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0AEFBA0F;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise6));

always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{noise[31]}, {13'h00000000}, {noise[30:14]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_10db (Y, clk, Y_hat, noise);
input	reg	[31:0]	Y;	
input   clk;
output reg [31:0]  	Y_hat, noise;
wire noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0AEF6A04;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise6));

always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= { {noise[31]}, {12'h00000000}, {noise[30:13]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_0db (Y, clk, Y_hat, noise);
input	reg	[31:0]	Y;	
input   clk;
output reg [31:0]  	Y_hat, noise;
wire noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0A2F6204;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise6));

always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{noise[31]}, {11'h00000000}, {noise[30:12]}}^Y; //possibly neeed to mod
end
endmodule

module gaussian_noise_m10db (Y, clk, Y_hat, noise);
input	reg	[31:0]	Y;	
input   clk;
output reg [31:0]  	Y_hat, noise;
wire noise1,noise2, noise3,noise4,noise5, noise6;
reg [31:0] seed = 32'h0112C6204;

uniformRV32 uniformRV32_1( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise1));
uniformRV32 uniformRV32_2( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise2));
uniformRV32 uniformRV32_3( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise3));
uniformRV32 uniformRV32_4( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise4));
uniformRV32 uniformRV32_5( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise5));
uniformRV32 uniformRV32_6( .SEED (seed) , .RST (0), .CLK (clk), .Y (noise6));

always@(*)	 begin
	 noise <= (noise1^noise2^noise3^noise4^noise5^noise6);
	 Y_hat<= {{noise[31]}, {10'h00000000}, {noise[30:11]}}^Y; //possibly neeed to mod
end
endmodule

