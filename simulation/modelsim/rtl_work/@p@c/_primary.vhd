library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        Reset           : in     vl_logic;
        PC_in           : in     vl_logic_vector(31 downto 0);
        PC_out          : out    vl_logic_vector(31 downto 0)
    );
end PC;
