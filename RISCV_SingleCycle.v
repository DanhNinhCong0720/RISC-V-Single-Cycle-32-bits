module RISCV_SingleCycle
(
	input [31:0] Instruction,
	input CLK, ResetPC
);
	wire ALUSrc, MemToReg, RegWrite, MemWrite, MemRead, Branch, Sign, Zero;
	wire [2:0] ALUOp;
	wire [3:0] ALUControl;

	ControlUnit Controller
	(
		.Op(Instruction[6:0]),
		.Branch(Branch),
		.MemRead(MemRead),
		.MemToReg(MemToReg),
		.ALUOp(ALUOp),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.RegWrite(RegWrite)
	);
	
	ALUControl ALUcontrol
	(
		.funct3(Instruction[14:12]),
		.funct7b5(Instruction[30]),
		.ALUOp(ALUOp),
		.ALUControl(ALUControl)
	);
	
	FullDatapath Datapath
	(
		.CLK(CLK),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.ALUControl(ALUControl),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.MemToReg(MemToReg),
		.Sign(Sign),
		.Zero(Zero),
		.ResetPC(ResetPC),
		.Branch(Branch),
		.Instruction(Instruction)
	);
endmodule 