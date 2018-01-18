library verilog;
use verilog.vl_types.all;
entity binary_into_BCD_using_flip_flop is
    port(
        Si              : in     vl_logic;
        Ci              : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        So              : out    vl_logic;
        Co              : out    vl_logic;
        BCD             : out    vl_logic_vector(3 downto 0)
    );
end binary_into_BCD_using_flip_flop;
