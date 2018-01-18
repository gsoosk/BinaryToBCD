library verilog;
use verilog.vl_types.all;
entity compare_with_5 is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        Gt              : out    vl_logic
    );
end compare_with_5;
