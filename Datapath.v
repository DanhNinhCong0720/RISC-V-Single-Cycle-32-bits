module Datapath
(
	input CLK, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg,
	input [3:0] ALUControl,
	input [31:0] Instruction,
	output Sign, Zero,
	output [31:0] Imm
);
	wire [4:0] WR;
	wire [31:0] RD1, RD2, SrcB, ALUResult, RD, WD;
	wire ALU_carry;

	RegisterFile RF
	(
		.CLK(CLK),
		.ReadAddress1(Instruction[19:15]),
		.ReadAddress2(Instruction[24:20]),
		.WriteAddress(Instruction[11:7]),
		.WriteData(WD),
		.ReadData1(RD1),
		.ReadData2(RD2),
		.WriteEn(RegWrite)
	);
	
	ImmediateGenerator ImmGen
	(
		.instruction(Instruction),
		.immediate(Imm)
	);
	
	Mux21_32bit Mux1
	(
		.I0(RD2),
		.I1(Imm),
		.S(ALUSrc),
		.Q(SrcB)
	);
	
	ALU Alu
	(
		.SrcA(RD1),
		.SrcB(SrcB),
		.ALUControl(ALUControl),
		.ALUResult(ALUResult),
		.Zero(Zero),
		.Sign(Sign)
	);
	
	DataMemory DataMem
	(
		.CLK(CLK),
		.Address(ALUResult),
		.WriteData(RD2),
		.WriteEn(MemWrite),
		.ReadEn(MemRead),
		.ReadData(RD)
	);
	
	Mux21_32bit Mux2
	(
		.I0(ALUResult),
		.I1(RD),
		.S(MemToReg),
		.Q(WD)
	);
endmodule 