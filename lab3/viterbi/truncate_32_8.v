module truncate_32_8 (A_32, out_8);
input [31:0] A_32;
output [7:0] out_8;

assign out_8 = A_32[31:24];

endmodule