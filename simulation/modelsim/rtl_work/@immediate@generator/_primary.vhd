library verilog;
use verilog.vl_types.all;
entity ImmediateGenerator is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        immediate       : out    vl_logic_vector(31 downto 0)
    );
end ImmediateGenerator;
