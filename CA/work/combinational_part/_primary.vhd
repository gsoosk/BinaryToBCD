library verilog;
use verilog.vl_types.all;
entity combinational_part is
    port(
        start           : in     vl_logic;
        countComplete   : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        done            : out    vl_logic;
        shiftCount      : out    vl_logic;
        loadBin         : out    vl_logic
    );
end combinational_part;
