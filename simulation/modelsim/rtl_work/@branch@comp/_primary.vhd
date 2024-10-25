library verilog;
use verilog.vl_types.all;
entity BranchComp is
    port(
        PC_out          : in     vl_logic_vector(31 downto 0);
        Imm             : in     vl_logic_vector(31 downto 0);
        Branch          : in     vl_logic;
        Zero            : in     vl_logic;
        PC_in           : out    vl_logic_vector(31 downto 0)
    );
end BranchComp;
