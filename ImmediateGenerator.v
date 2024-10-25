module ImmediateGenerator
(
	input [31:0] instruction,
	output reg [31:0] immediate
);
	always@(*)
		case (instruction[6:0])
			// I type
			7'b0000011, 7'b0010011, 7'b1100111: immediate = {{21{instruction[31]}}, instruction[30:20]};
			// S type
			7'b0100011: immediate = {{21{instruction[31]}}, instruction[30:25], instruction[11:7]};
			// B type
			7'b1100011: immediate = {{20{instruction[31]}}, instruction[7],instruction[30:25], instruction[11:8], 1'b0};
			// U type
			7'b0010111, 7'b0110111: immediate = {instruction[31:12], 12'b0};
			// J type
			7'b1101111: immediate = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
			default: immediate = 32'dx;
		endcase
endmodule 