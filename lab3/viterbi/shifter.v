module shifter (Y, select, out);
input	reg	[31:0]	Y;	
input	reg	[2:0]	select;	
output reg [31:0]  	out;

always@(*)	 begin
if(select == 3'b000) begin //40dB
 out<= {{10'h00000000} , {Y[31:10]}}; 
end
else if(select == 3'b001) begin //30dB
 out<= {{8'h00000000} , {Y[31:8]}}; 
end
else if(select == 3'b010) begin //20dB
 out<= {{6'h00000000} , {Y[31:6]}}; 
end
else if(select == 3'b011) begin //10dB
 out<= {{4'h00000000} , {Y[31:4]}}; 
end
else if(select == 3'b100) begin //0dB
 out<= {{2'h00000000} , {Y[31:2]}}; 
end
else if(select == 3'b101) begin //-10dB
 out<= Y; 
end
else begin 
 out<= Y; 
end
end
endmodule
