library verilog;
use verilog.vl_types.all;
entity add_with_3 is
    port(
        B               : in     vl_logic_vector(3 downto 0);
        A               : in     vl_logic_vector(3 downto 0);
        ci              : in     vl_logic;
        S               : out    vl_logic_vector(3 downto 0);
        co              : out    vl_logic
    );
end add_with_3;
