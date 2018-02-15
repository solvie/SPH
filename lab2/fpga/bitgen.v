module	bitgen	(SEL,bitstream);	
input	[3:0]	SEL;	
output	reg	bitstream;
always	@	(SEL)	begin
bitstream	=	0;	//	Initializing	the	default	value	of	the	output	bit	to	be	0
case	(SEL)	//	Here	we	are	identifying	a	set	of	special	cases	for	the	input	vector	SEL.
	4'b0001	:	bitstream	=	1'b1;	//If	the	input	vector	SEL	is	equivalent	to	any	of	the	cases	indicated	on	the
	4'b0010	:	bitstream	=	1'b0;	//left	of	the	colon,	a	specific	bit	will	be	produced	as	output	(i.e.	if	the	SEL
	4'b0011	:	bitstream	=	1'b0;	//line	equates	0101,	the	output	bit	will	be	1).
	4'b0100	:	bitstream	=	1'b0;
	4'b0101	:	bitstream	=	1'b1;
	4'b0110	:	bitstream	=	1'b1;
	4'b0111	:	bitstream	=	1'b0;
	4'b1000	:	bitstream	=	1'b1;
endcase
end	//	Closing	out	the	always	method.
endmodule