library verilog;
use verilog.vl_types.all;
entity four_bit_register_v2 is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        RST             : in     vl_logic;
        CLK             : in     vl_logic;
        Q               : out    vl_logic_vector(3 downto 0)
    );
end four_bit_register_v2;
