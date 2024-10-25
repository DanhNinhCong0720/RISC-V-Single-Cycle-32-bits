module DataMemory
(
	input CLK, WriteEn, ReadEn,
	input [31:0] Address,
	input [31:0] WriteData,
	output reg [31:0] ReadData
);
	reg [31:0] RAM [63:0]; // 64x32 bit memory

	always @ (posedge CLK)
	begin
		if(WriteEn && !ReadEn)
			RAM[Address] <= WriteData;
		else if (!WriteEn && ReadEn)
			ReadData = RAM[Address];
	end
endmodule 