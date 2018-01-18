module binary_into_bcd_with_controller(input [15:0] Bin, input start, clk, rst, output[15:0] BCD, output done, co, so);
  wire shiftCount, loadBin;
  controller circut_controller(start, clk, rst, done, shiftCount, loadBin);
  dataPath circut_dataPath(Bin, clk, rst, shiftCount, loadBin, BCD, co, so);  
endmodule 

module binary_into_bcd_with_controller_TB();
  reg [15:0] Bin = 16'b0001101111100110;
  reg start = 0;
  reg clk=0;
  reg rst = 1 ;
  wire co, so, done;
  wire [15:0] BCD;
  binary_into_bcd_with_controller uut(Bin,start, clk, rst, BCD, done, co, so);
  initial repeat(170) #12 clk=~clk;
  initial begin
    #30 rst=0;
    #50 start=1;
    #70 start=0;
    #700 Bin=16'd321;
    #5 start=1;
    #20 start=0;
  end  
endmodule