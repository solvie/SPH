module agrregate_ouput_4(in_1_1_1, in_1_1_2, in_1_1_3, in_1_1_4, in_2_1_1, in_2_1_2, in_2_2_1, in_2_2_2, in_2_3_3, in_2_3_4, in_2_4_3, in_2_4_4, in_3_1_1, in_3_1_2, in_3_2_1, in_3_2_2, in_3_3_3, in_3_3_4, in_3_4_3, in_3_4_4, in_4_1_1, in_4_1_2, in_4_1_3, in_4_1_4, out);

input [7:0] in_1_1_1, in_1_1_2, in_1_1_3, in_1_1_4, in_2_1_1, in_2_1_2, in_2_2_1, in_2_2_2, in_2_3_3, in_2_3_4, in_2_4_3, in_2_4_4, in_3_1_1, in_3_1_2, in_3_2_1, in_3_2_2, in_3_3_3, in_3_3_4, in_3_4_3, in_3_4_4, in_4_1_1, in_4_1_2, in_4_1_3, in_4_1_4;

output reg [7:0] out;
integer [4:0] weight_order_1, weight_order_4;
integer [7:0] weight_order_2, weight_order_3;

integer [4:0] final_edges;

reg signed [7:0] min_sum_1,min_sum_2, min_sum_3, min_sum_4;

always @(*)
//stage 1



//stage 2



//stage 3



//stage 4

for (i = 0; i < 4; i = i +1) begin
	// 00
	if(final[i]==1 || final[i]==5 || final[i]==8 || final[i]==13 || final[i]==16 || final[i]==21) begin
		case(i)
			0:begin 
				out[0] <= 0;
				out[1] <= 0;
			end
			1:begin 
				out[2] <= 0;
				out[4] <= 0;
			end
			2:begin 
				out[3] <= 0;
				out[5] <= 0;
			end
			3:begin 
				out[6] <= 0;
				out[7] <= 0;
			end
	end
	// 11
	else if(final[i]==2 || final[i]==6 || final[i]==7 || final[i]==14 || final[i]==15 || final[i]==22) begin
		case(i)
			0:begin 
				out[0] <= 1;
				out[1] <= 1;
			end
			1:begin 
				out[2] <= 1;
				out[4] <= 1;
			end
			2:begin 
				out[3] <= 1;
				out[5] <= 1;
			end
			3:begin 
				out[6] <= 1;
				out[7] <= 1;
			end
	end
	//10
	else if(final[i]==3 || final[i]==10 || final[i]==11 || final[i]==18 || final[i]==19 || final[i]==23) begin
		case(i)
			0:begin 
				out[0] <= 1;
				out[1] <= 0;
			end
			1:begin 
				out[2] <= 1;
				out[4] <= 0;
			end
			2:begin 
				out[3] <= 1;
				out[5] <= 0;
			end
			3:begin 
				out[6] <= 1;
				out[7] <= 0;
			end
	end
	// 01
	else begin
		case(i)
			0:begin 
				out[0] <= 0;
				out[1] <= 1;
			end
			1:begin 
				out[2] <= 0;
				out[4] <= 1;
			end
			2:begin 
				out[3] <= 0;
				out[5] <= 1;
			end
			3:begin 
				out[6] <= 0;
				out[7] <= 1;
			end
	end
	
end


endmodule