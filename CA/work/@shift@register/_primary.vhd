library verilog;
use verilog.vl_types.all;
entity ShiftRegister is
    port(
        pi              : in     vl_logic_vector(15 downto 0);
        sir             : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        shiftEnable     : in     vl_logic;
        Lden            : in     vl_logic;
        sout            : out    vl_logic_vector(15 downto 0);
        sol             : out    vl_logic
    );
end ShiftRegister;
