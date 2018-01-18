library verilog;
use verilog.vl_types.all;
entity binary_into_bcd_with_controller is
    port(
        Bin             : in     vl_logic_vector(15 downto 0);
        start           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        BCD             : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        co              : out    vl_logic;
        so              : out    vl_logic
    );
end binary_into_bcd_with_controller;
