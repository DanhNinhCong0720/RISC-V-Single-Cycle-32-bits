library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        CLK             : in     vl_logic;
        RegWrite        : in     vl_logic;
        ALUSrc          : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        MemToReg        : in     vl_logic;
        ALUControl      : in     vl_logic_vector(3 downto 0);
        Instruction     : in     vl_logic_vector(31 downto 0);
        Sign            : out    vl_logic;
        Zero            : out    vl_logic;
        Imm             : out    vl_logic_vector(31 downto 0)
    );
end Datapath;
