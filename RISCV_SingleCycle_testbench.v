`timescale 1ns/100ps
module RISCV_SingleCycle_testbench;
	reg CLK, ResetPC;
	reg [31:0] Instruction;
	
	RISCV_SingleCycle Processor
	(
		.CLK(CLK),
		.ResetPC(ResetPC),
		.Instruction(Instruction)
	);
	
	initial begin
		CLK = 0;
		forever #10 CLK = ~CLK;
	end
	
	initial begin
		Instruction = 32'b0000000_00010_00011_000_00001_0110011;
		ResetPC = 1;
		
		// add $x1 = $x3 + $x2 #R type
		#20
		Instruction = 32'b0000000_00010_00011_000_00001_0110011;
		ResetPC = 0;
		
		// sub $x4 = $x2 - $x3 #R type
		#20
		Instruction = 32'b0100000_00011_00010_000_00100_0110011;
		
		// or $x5 = $x2 | $x3 #R type
		#40
		Instruction = 32'b0000000_00011_00010_110_00101_0110011;
		
		// and $x6 = $x2 & $x3 #R type
		#20
		Instruction = 32'b0000000_00011_00010_111_00110_0110011;
		
		// sll $x7 = $x2 << $x3 #R type
		#20
		Instruction = 32'b0000000_00011_00010_001_00111_0110011;
		
		// slt $x8 = ($x2 << $x3) ? 1 : 0 #R type
		#20
		Instruction = 32'b0000000_00011_00010_010_01000_0110011;
		
		// addi $x9 = $x2 + 20 #I type
		#20
		Instruction = 32'b000000010100_00010_000_01001_0010011;
		
		// xori $x10 = $x2 ^ 20 #I type
		#20
		Instruction = 32'b000000010100_00010_100_01010_0010011;
		
		// ori $x11 = $x2 | 20 #I type
		#20
		Instruction = 32'b000000010100_00010_110_01011_0010011;
		
		// andi $x12 = $x2 & 20 #I type
		#20
		Instruction = 32'b000000010100_00010_111_01100_0010011;
		
		// sw M[$x2 + 20] = $x1 #S type
		#40
		Instruction = 32'b0000000_00001_00010_010_10100_0100011;
		
		// lw $x14 = M[$x2 + 20] #I type
		#40
		Instruction = 32'b000000010100_00010_010_01110_0000011;
		
		// xor $x15 = $x2 ^ $x3 #R type
		#40
		Instruction = 32'b0000000_00011_00010_100_01111_0110011;
		
		// srl $x16 = $x2 >> $x3 #R type
		#40
		Instruction = 32'b0000000_00011_00010_101_10000_0110011;
		
		// sltu $x17 = $x2 < $x3 ? 1 : 0 #R type
		#20
		Instruction = 32'b0000000_00011_00010_011_10001_0110011;
		
		// slli $x18 = $x2 << 2 #I type
		#20
		Instruction = 32'b0000000_00010_00010_001_10010_0010011;
		
		// srli $x19 = $x2 >> 2 #I type
		#20
		Instruction = 32'b0000000_00010_00010_001_10011_0010011;
		
		// slti $x20 = $x2 < 20 ? 1 : 0 #I type
		#20
		Instruction = 32'b0000000_10100_00010_010_10100_0010011;
		
		// sltiu $x21 = $x2 < 20 ? 1 : 0 #I type
		#20
		Instruction = 32'b0000000_10100_00010_010_10101_0010011;
		
		// lui $x22 = 21 << 12 #U type
		#20
		Instruction = 32'b00000000000000010101_10110_0110111;
		
		// beq $x2 = $x5 (=7) PC += PC + Imm, Imm = 20 #B type
		#20
		Instruction = 32'b0000000_00010_00101_000_10100_1100011;
	end
	
	initial begin
		#600 $stop;
	end
endmodule 