`timescale 1ns/1ns

module controller(input start, clk, rst, output done, shiftCount, loadBin);
  wire countComplete;
  counter ourCounter(shiftCount, clk, rst, countComplete);
  combinational_part comb(start, countComplete, clk, rst, done, shiftCount, loadBin);
endmodule


module combinational_part(input start, countComplete, clk, rst, output done, shiftCount, loadBin);
  wire D1,D0,V1,V0;
  assign D1 = (V1&V0) | (~countComplete&V1) | (~start&V0);
  assign D0 = (~V1&V0) | (start &~V1);
  assign done = ~V1&~V0;
  assign shiftCount = V1&~V0;
  assign loadBin = V1&V0;
  
  D_type_flip_flop_with_rst flipFlop1(D0, rst, clk, V0);
  D_type_flip_flop_with_rst flipFlop2(D1, rst, clk, V1);
endmodule 
module comb_TB();
  reg start=1; 
  reg countComplete=0;
  reg rst=1;
  reg clk=0;
  wire done, shiftCount, loadBin;
  combinational_part uut1(start,countComplete,clk,rst,done,shiftCount,loadBin);
  initial repeat(170) #12 clk=~clk;
  initial begin
    #30 rst=0;
    #30 start=0;
    #60 start=1;
    #90 start=0;
  end
endmodule 


module counter(input shiftCount, clk, rst, output countComplete);
  reg[3:0] p;
  always @ ( posedge clk, posedge rst ) begin
    if(rst) p <= 4'b0;
    else
      if(shiftCount) p <= p+1;
      else p <= p;
  end
  assign countComplete = &{p,4'b1111};
endmodule
module counter_TB();
  reg shiftCount=0;
  reg rst=1;
  reg clk=0;
  wire countComplete;
  counter uut1(shiftCount, clk, rst, countComplete);
   initial repeat(170) #12 clk=~clk;
  initial begin
    #30 rst=0;
    #60 shiftCount=1;
  end  
endmodule 