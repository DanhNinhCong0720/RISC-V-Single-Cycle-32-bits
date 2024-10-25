module FullDatapath
(
	input CLK, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg, Branch, ResetPC,
	input [3:0] ALUControl,
	input [31:0] Instruction,
	output Sign, Zero
);

	wire [4:0] WR;
	wire [31:0] RD1, RD2, SrcB, ALUResult, RD, SE, WD, BCRes, PCRes, Imm;
	wire ALU_carry;
	
	PC PC
	(
		.clk(CLK),
		.Reset(ResetPC),
		.PC_in(BCRes),
		.PC_out(PCRes)
	);
	
//	InstructionMemory IM
//	(
//		.Address(PCRes),
//		.Instruction(Instruction)
//	);
	
	Datapath DTPath
	(
		.CLK(CLK),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.ALUControl(ALUControl),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.MemToReg(MemToReg),
		.Instruction(Instruction),
		.Sign(Sign),
		.Zero(Zero),
		.Imm(Imm)
	);
	
	BranchComp BC
	(
		.PC_in(BCRes),
		.PC_out(PCRes),
		.Imm(Imm),
		.Branch(Branch),
		.Zero(Zero)
	);
endmodule 