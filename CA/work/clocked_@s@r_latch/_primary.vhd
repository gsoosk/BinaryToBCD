library verilog;
use verilog.vl_types.all;
entity clocked_SR_latch is
    port(
        S               : in     vl_logic;
        R               : in     vl_logic;
        CLK             : in     vl_logic;
        Q               : out    vl_logic
    );
end clocked_SR_latch;
