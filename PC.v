module PC
(
	input clk,
	input Reset,
	input [31:0] PC_in,
	output reg [31:0] PC_out
);
	always @(posedge clk)
	begin
		if (Reset == 1'b1)
			PC_out <= 32'b0;
		else
			PC_out <= PC_in;
	end
endmodule 