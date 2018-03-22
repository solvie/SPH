module gaussian_noise (Y, select, clk, Y_hat, noise_debug, reset, state);
input reg [31:0] Y ;
input reg[2:0] select, reset;
input clk;

output reg [31:0] Y_hat, noise_debug;
output reg [2:0] state;
wire reset_0;
reg [31:0] Y_hat_40, Y_hat_30, Y_hat_20, Y_hat_10, Y_hat_0, Y_hat_m10;
reg [31:0] noise_debug_40, noise_debug_30, noise_debug_20, noise_debug_10, noise_debug_0, noise_debug_m10;

gaussian_noise_40db gaussian_noise_40db_1(.Y (Y), .clk (clk), .Y_hat (Y_hat_40), .noise (noise_debug_40), .reset(reset_0));

gaussian_noise_30db gaussian_noise_30db_1(.Y (Y), .clk (clk), .Y_hat (Y_hat_30), .noise (noise_debug_30), .reset(reset_0));

gaussian_noise_20db gaussian_noise_20db_1(.Y (Y), .clk (clk), .Y_hat (Y_hat_20), .noise (noise_debug_20), .reset(reset_0));

gaussian_noise_10db gaussian_noise_10db_1(.Y (Y), .clk (clk), .Y_hat (Y_hat_10), .noise (noise_debug_10), .reset(reset_0));

gaussian_noise_0db gaussian_noise_0db_1(.Y (Y), .clk (clk), .Y_hat (Y_hat_0), .noise (noise_debug_0), .reset(reset_0));

gaussian_noise_m10db gaussian_noise_m10db_1(.Y (Y), .clk (clk), .Y_hat (Y_hat_m10), .noise (noise_debug_m10), .reset(reset_0));


always@(*)	 begin
reset_0<=reset[0];
if(select == 3'b000) begin 
	Y_hat<=Y_hat_40;
	noise_debug <= noise_debug_40;
	state<=select;	
end
else if(select == 3'b001) begin 
	Y_hat<=Y_hat_30;
	noise_debug <= noise_debug_30; 
	state<=select;	
end
else if(select == 3'b010) begin 
	Y_hat<=Y_hat_20;
	noise_debug <= noise_debug_20; 
	state<=select;	
end
else if(select == 3'b011) begin 
	Y_hat<=Y_hat_10;
	noise_debug <= noise_debug_10; 
	state<=select;	
end
else if(select == 3'b100) begin 
	Y_hat<=Y_hat_0;
	noise_debug <= noise_debug_0; 
	state<=select;	
end
else if(select == 3'b101) begin 
	Y_hat<=Y_hat_m10;
	noise_debug <= noise_debug_m10; 
	state<=select;	
end
else begin 
	Y_hat<=Y;
	noise_debug <= 32'h00000000; 
	state<=select;	
end
end
endmodule
