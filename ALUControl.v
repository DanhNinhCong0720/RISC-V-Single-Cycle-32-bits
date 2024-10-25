module ALUControl
(
	input [2:0] funct3,
	input funct7b5,
	input [2:0] ALUOp,
	output reg [3:0] ALUControl
);
	always@(*)
		case(ALUOp)
			3'b000:
				case(funct3) // R–type or I–type ALU
					3'b000:
						if (funct7b5)
							ALUControl = 4'b0001; // sub
						else
							ALUControl = 4'b0000; // add, addi
							
					3'b001: ALUControl = 4'b0100; // sll, slli
					3'b010: ALUControl = 4'b0101; // slt, slti
					3'b011: ALUControl = 4'b1000; // sltu, sltiu
					3'b100: ALUControl = 4'b0110; // xor, xori
					3'b101:
						if (~funct7b5)
							ALUControl = 4'b0111;	// srl
						else
							ALUControl = 4'b1111;  // sra
						
					3'b110: ALUControl = 4'b0011; // or, ori
					3'b111: ALUControl = 4'b0010; // and, andi
					default: ALUControl = 4'bxxxx; // ???
				endcase
			3'b001: ALUControl = 4'b0000; //lw
			3'b010: ALUControl = 4'b0000; //sw
			3'b011: ALUControl = 4'b0001; //beq
			3'b100: ALUControl = 4'b1001; //lui
		endcase
endmodule 