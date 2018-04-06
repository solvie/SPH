module add_compute_store_8_4_4(in_1_1_1, in_1_1_2, in_1_1_3, in_1_1_4, in_2_1_1, in_2_1_2, in_2_2_1, in_2_2_2, in_2_3_3, in_2_3_4, in_2_4_3, in_2_4_4, in_3_1_1, in_3_1_2, in_3_2_1, in_3_2_2, in_3_3_3, in_3_3_4, in_3_4_3, in_3_4_4, in_4_1_1, in_4_2_1, in_4_3_1, in_4_4_1, out, survivor_1_1, survivor_1_2, survivor_1_3, survivor_1_4, survivor_2_1, survivor_2_2, survivor_2_3, survivor_2_4, );

input [7:0] in_1_1_1, in_1_1_2, in_1_1_3, in_1_1_4, in_2_1_1, in_2_1_2, in_2_2_1, in_2_2_2, in_2_3_3, in_2_3_4, in_2_4_3, in_2_4_4, in_3_1_1, in_3_1_2, in_3_2_1, in_3_2_2, in_3_3_3, in_3_3_4, in_3_4_3, in_3_4_4, in_4_1_1, in_4_2_1, in_4_3_1, in_4_4_1;

output reg [7:0] out;
output reg signed [7:0] survivor_1_1, survivor_1_2, survivor_1_3, survivor_1_4;
output reg signed [7:0] survivor_2_1, survivor_2_2, survivor_2_3, survivor_2_4;
output reg signed [7:0] survivor_1, survivor_2, survivor_3, survivor_4, survivor_f_1, survivor_f_2, survivor_f;

integer path_1_edges[3:0], path_2_edges[3:0], path_3_edges[3:0], path_4_edges[1:0], path_4_edge, final_edges[3:0];

integer i;

wire comp_r_1_1, comp_r_1_2, comp_r_1_3, comp_r_1_4, comp_r_2_1, comp_r_2_2, comp_r_2_3, comp_r_2_4, comp_r_3_1, comp_r_3_2, comp_r_f;


reg signed [7:0] final_edge_weight;

comparator_8_bit comp_1_1 (.A(survivor_1_1+in_2_1_1), .B(survivor_1_1+in_2_2_1), .comp_out(comp_r_1_1));
comparator_8_bit comp_1_2 (.A(survivor_1_2+in_2_1_2), .B(survivor_1_2+in_2_2_2), .comp_out(comp_r_1_2));
comparator_8_bit comp_1_3 (.A(survivor_1_3+in_2_3_3), .B(survivor_1_3+in_2_4_3), .comp_out(comp_r_1_3));
comparator_8_bit comp_1_4 (.A(survivor_1_4+in_2_3_4), .B(survivor_1_4+in_2_4_4), .comp_out(comp_r_1_4));

comparator_8_bit comp_2_1 (.A(survivor_2_1+in_3_1_1), .B(survivor_2_1+in_3_2_1), .comp_out(comp_r_2_1));
comparator_8_bit comp_2_2 (.A(survivor_2_2+in_3_1_2), .B(survivor_2_2+in_3_2_2), .comp_out(comp_r_2_2));
comparator_8_bit comp_2_3 (.A(survivor_2_3+in_3_3_3), .B(survivor_2_3+in_3_4_3), .comp_out(comp_r_2_3));
comparator_8_bit comp_2_4 (.A(survivor_2_4+in_3_3_4), .B(survivor_2_4+in_3_4_4), .comp_out(comp_r_2_4));

comparator_8_bit comp_3_1 (.A(survivor_1+in_4_1_1), .B(survivor_2+in_4_2_1), .comp_out(comp_r_3_1));
comparator_8_bit comp_3_2 (.A(survivor_3+in_4_3_1), .B(survivor_4+in_4_4_1), .comp_out(comp_r_3_2));
comparator_8_bit comp_3_3 (.A(survivor_f_1), .B(survivor_f_2), .comp_out(comp_r_f));


always @(*) begin
//stage 1
survivor_1_1 <= in_1_1_1; 
survivor_1_2 <= in_1_1_2;
survivor_1_3 <= in_1_1_3;
survivor_1_4 <= in_1_1_4;

path_1_edges[0] <= 1;
path_1_edges[1] <= 2;
path_1_edges[2] <= 3;
path_1_edges[3] <= 4;

//stage 2
if (comp_r_1_1==1) begin
// bottom path
	survivor_2_1 <= survivor_1_1+in_2_2_1;
	path_2_edges[0]<= 7;
end
else begin 
	survivor_2_1 <= survivor_1_1+in_2_1_1;
	path_2_edges[0]<= 5;
end
if (comp_r_1_2==1) begin
	survivor_2_2 <= survivor_1_2+in_2_2_2;
	path_2_edges[1]<= 8;
end
else begin 
	survivor_2_2 <= survivor_1_2+in_2_1_2;
	path_2_edges[1]<= 6;
end

if (comp_r_1_3==1) begin
	survivor_2_3 <= survivor_1_3+in_2_4_3;
	path_2_edges[2]<= 11;
end
else begin 
	survivor_2_3 <= survivor_1_3+in_2_3_3;
	path_2_edges[2]<= 9;
end
if (comp_r_1_4==1) begin
	survivor_2_4 <= survivor_1_4+in_2_4_4;
	path_2_edges[3]<= 12;
end
else begin 
	survivor_2_4 <= survivor_1_4+in_2_3_4;
	path_2_edges[3]<= 10;
end

//stage 3
if (comp_r_2_1==1) begin
	survivor_1 <= survivor_2_1+in_3_2_1;
	path_3_edges[0]<= 15;
end
else begin 
	survivor_1 <= survivor_2_1+in_3_1_1;
	path_3_edges[0]<= 13;
end
if (comp_r_2_2==1) begin
	survivor_2 <= survivor_2_2+in_3_2_2;
	path_3_edges[1]<= 16;
end
else begin 
	survivor_2 <= survivor_2_2+in_3_1_2;
	path_3_edges[1]<= 14;
end

if (comp_r_2_3==1) begin
	survivor_3 <= survivor_2_3+in_3_4_3;
	path_3_edges[2]<= 19;
end
else begin 
	survivor_3 <= survivor_2_3+in_3_3_3;
	path_3_edges[2]<= 17;
end
if (comp_r_2_4==1) begin
	survivor_4 <= survivor_2_4+in_3_4_4;
	path_3_edges[3]<= 20;
end
else begin 
	survivor_4 <= survivor_2_4+in_3_3_4;
	path_3_edges[3]<= 18;
end

//stage 4
if (comp_r_3_1==1) begin
	survivor_f_1 <= survivor_2+in_4_2_1;
	path_4_edges[0] <= 22;
end
else begin 
	survivor_f_1 <= survivor_1+in_4_1_1;
	path_4_edges[0] <= 21;
end
if (comp_r_3_2==1) begin
	survivor_f_2 <= survivor_4+in_4_4_1;
	path_4_edges[1] <= 24;
end
else begin 
	survivor_f_2 <= survivor_3+in_4_3_1;
	path_4_edges[1] <= 23;
end

if (comp_r_f==1) begin
	survivor_f <= survivor_f_2;
	path_4_edge <= path_4_edges[1];
end
else begin 
	survivor_f <= survivor_f_1;
	path_4_edge <= path_4_edges[0];
end

final_edges[3] <= path_4_edge;
final_edges[2] <= path_3_edges[final_edges[3]%21];

if (final_edges[2] > 18) begin
	final_edges[1] <= path_2_edges[3];
end
else if (final_edges[2] > 16) begin
	final_edges[1] <= path_2_edges[2];
end
else if (final_edges[2] > 14) begin
	final_edges[1] <= path_2_edges[1];
end
else if (final_edges[2] > 12) begin
	final_edges[1] <= path_2_edges[0];
end

if (final_edges[1] == 4) begin
	final_edges[0] <= path_1_edges[3];
end
else if (final_edges[2] == 3) begin
	final_edges[0] <= path_1_edges[2];
end
else if (final_edges[2] == 2) begin
	final_edges[0] <= path_1_edges[1];
end
else if (final_edges[2] == 1) begin
	final_edges[0] <= path_1_edges[0];
end

// set output
for (i = 0; i < 4; i = i +1) begin
	// 00
	if(final_edges[i]==1 || final_edges[i]==5 || final_edges[i]==8 || final_edges[i]==13 || final_edges[i]==16 || final_edges[i]==21) begin
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
		endcase
	end
	// 11
	else if(final_edges[i]==2 || final_edges[i]==6 || final_edges[i]==7 || final_edges[i]==14 || final_edges[i]==15 || final_edges[i]==22) begin
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
		endcase
	end
	//10
	else if(final_edges[i]==3 || final_edges[i]==10 || final_edges[i]==11 || final_edges[i]==18 || final_edges[i]==19 || final_edges[i]==23) begin
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
		endcase
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
		endcase
	end
	
end
end

endmodule