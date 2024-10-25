module Mux21_32bit
(
	input [31:0] I0, I1,
	input S,
	output [31:0] Q
);
	assign Q = (S == 1'b0) ? I0 : I1;
endmodule 