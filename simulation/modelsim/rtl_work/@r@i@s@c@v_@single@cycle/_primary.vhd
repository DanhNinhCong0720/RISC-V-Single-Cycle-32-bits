library verilog;
use verilog.vl_types.all;
entity RISCV_SingleCycle is
    port(
        Instruction     : in     vl_logic_vector(31 downto 0);
        CLK             : in     vl_logic;
        ResetPC         : in     vl_logic
    );
end RISCV_SingleCycle;
