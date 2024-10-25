module BranchComp
(
	input [31:0] PC_out, Imm,
	input Branch,
	input Zero,
	output [31:0] PC_in
);
	reg [31:0] SumImm;
	reg [31:0] Sum4;
	reg Sel;
	
	always@(*)
	begin	
		SumImm = PC_out + (Imm<<2);
		Sum4 = PC_out + 4;
		Sel = Branch&Zero;
	end
	
	Mux21_32bit Mux
	(
		.I0(Sum4),
		.I1(SumImm),
		.S(Sel),
		.Q(PC_in)
	);
endmodule 