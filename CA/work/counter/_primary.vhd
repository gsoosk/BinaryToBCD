library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        shiftCount      : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        countComplete   : out    vl_logic
    );
end counter;
