library verilog;
use verilog.vl_types.all;
entity D_type_flip_flop_with_rst is
    port(
        D               : in     vl_logic;
        RST             : in     vl_logic;
        CLK             : in     vl_logic;
        Q               : out    vl_logic
    );
end D_type_flip_flop_with_rst;
