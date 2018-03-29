module comparator_8_bit(A, B, comp_out);
input [7:0] A,B;
output reg comp_out;
integer i;
always @(*) begin
		for (i=0 ; i < 8; i=i+1)begin
		 if(A[i]^B[i] == 1)
		 begin 
			if (A[i] == 1) 
			begin
				comp_out <= 1;
				break;
			end
			else 
			begin
				comp_out <= 0;
				break;
			end
		 end
		end
	comp_out<= 1;
end
endmodule