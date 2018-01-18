library verilog;
use verilog.vl_types.all;
entity dataPath is
    port(
        pi              : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        shiftCount      : in     vl_logic;
        loadBin         : in     vl_logic;
        BCD             : out    vl_logic_vector(15 downto 0);
        co              : out    vl_logic;
        so              : out    vl_logic
    );
end dataPath;
