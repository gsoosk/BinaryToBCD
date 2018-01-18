library verilog;
use verilog.vl_types.all;
entity clocked_D_latch is
    port(
        D               : in     vl_logic;
        CLK             : in     vl_logic;
        Q               : out    vl_logic
    );
end clocked_D_latch;
