library verilog;
use verilog.vl_types.all;
entity binary_into_BCD is
    port(
        si              : in     vl_logic;
        ci              : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        BCD             : out    vl_logic_vector(15 downto 0);
        co              : out    vl_logic;
        so              : out    vl_logic
    );
end binary_into_BCD;
