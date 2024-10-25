module ControlUnit
(	
	input [6:0] Op,
	output reg Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite,
	output reg [2:0] ALUOp
);
	always@(*)
		case(Op)
			//R-type
			7'b0110011:
			begin
				Branch =0;
				RegWrite = 1;
				ALUSrc = 0;
				MemWrite = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 3'b000;
			end
			
			//lw
			7'b0000011:
			begin
				Branch=0;
				RegWrite = 1'b1;
				ALUSrc = 1;
				MemWrite = 1'b0;
				MemRead = 1'b1;
				MemToReg = 1'b1;
				ALUOp = 3'b001;
			end
			
			//sw
			7'b0100011:
			begin
				Branch=0;
				RegWrite = 1'b0;
				ALUSrc = 1;
				MemWrite = 1'b1;
				MemRead = 1'b0;
				MemToReg = 1'b0;
				ALUOp = 3'b010;
			end
			
			//beq
			7'b1100011:
			begin
				Branch = 1;
				RegWrite = 1'b1;
				ALUSrc = 0;
				MemWrite = 1'b0;
				MemRead = 1'b1;
				MemToReg = 1'b0;
				ALUOp = 3'b011;
			end
			
			//lui
			7'b0110111:
			begin
				RegWrite = 1'b1;
				ALUSrc = 1;
				MemWrite = 1'b0;
				MemRead = 1'b1;
				MemToReg = 1'b0;
				ALUOp = 3'b100;
			end
			
			//I-type
			7'b0010011:
			begin
				Branch =0;
				RegWrite = 1;
				ALUSrc = 1;
				MemWrite = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 3'b000;
			end
		endcase
endmodule 