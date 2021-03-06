`timescale 1ns/1ns
module dataPath(input [15:0] pi,input clk, rst, shiftCount, loadBin, output[15:0] BCD, output co, so);
  wire[15:0] sout;
  wire si;
  ShiftRegister shift(pi, 1'b0, clk, rst, shiftCount, loadBin, sout, si);
  binary_into_BCD binToBCD(si, 1'b0, clk, rst, BCD, co, so);
endmodule

module ShiftRegister(input [15:0] pi, input sir, clk, rst, shiftEnable, Lden, output reg [15:0] sout, output sol);
  always @ ( posedge clk , posedge rst ) begin
    if(rst) sout <= 16'b0;
    else
      if(Lden) sout<=pi;
      else
        if(shiftEnable) sout <= {sout[14:0],sir};
        else sout <= sout;
  end
  assign sol = sout[15];
endmodule
