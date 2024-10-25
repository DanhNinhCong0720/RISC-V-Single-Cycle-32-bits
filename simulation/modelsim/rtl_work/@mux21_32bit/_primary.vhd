library verilog;
use verilog.vl_types.all;
entity Mux21_32bit is
    port(
        I0              : in     vl_logic_vector(31 downto 0);
        I1              : in     vl_logic_vector(31 downto 0);
        S               : in     vl_logic;
        Q               : out    vl_logic_vector(31 downto 0)
    );
end Mux21_32bit;
