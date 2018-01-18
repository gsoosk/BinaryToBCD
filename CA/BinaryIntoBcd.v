`timescale 1ns/1ns
module binary_into_BCD(input si, ci, clk, rst, output[15:0] BCD, output co, output so);	
	wire [2:0] i ;
	wire [2:0] j ;
	binary_into_BCD_using_flip_flop bcd1 (si, ci, clk, rst, i[0], j[0],BCD[3:0]) ;
	binary_into_BCD_using_flip_flop bcd2 (i[0], j[0], clk, rst, i[1], j[1],BCD[7:4]) ;
	binary_into_BCD_using_flip_flop bcd3 (i[1], j[1], clk, rst, i[2], j[2], BCD[11:8]);
	binary_into_BCD_using_flip_flop bcd4 (i[2], j[2], clk, rst, so, co, BCD[15:12]);
endmodule

module binary_into_BCD_using_flip_flop(input Si, Ci, CLK, RST, output So, Co, output[3:0] BCD);
  wire[3:0] registerInput;
	wire[3:0] adderInput;
	wire[3:0] adderOutput;
	wire gt;

	assign registerInput[0] = Si;
	assign So = adderOutput[3];
	assign registerInput[1] = adderOutput[0];
	assign registerInput[2] = adderOutput[1];
	assign registerInput[3] = adderOutput[2];

	four_bit_register_v2 register(registerInput, RST, CLK, BCD);
	compare_with_5 comprator(BCD, gt);
	
	assign adderInput[0] = gt;
	assign adderInput[1] = gt;
	assign adderInput[2] = 0;
	assign adderInput[3] = 0; 
	add_with_3 adder(BCD, adderInput, Ci, adderOutput, Co);

endmodule
module add_with_3(input [3:0]B, input [3:0]A, input ci, output [3:0]S, output co);
  wire C[3:1];
  //Slice 0
  wire i1;
  xor(i1, B[0],A[0]);
  xor(S[0], ci, i1 );
  wire i2, i3;
  and(i2, A[0], B[0]);
  and(i3, i1, ci);
  or(C[1], i2, i3);
  
  //Slice 1
  wire j1;
  xor(j1, B[1],A[1]);
  xor(S[1], C[1], j1 );
  wire j2, j3;
  and(j2, A[1], B[1]);
  and(j3, j1, C[1]);
  or(C[2], j2, j3);
  
  //Slice 2
  xor(S[2], B[2], C[2]);
  and(C[3], B[2], C[2]);
  
  //Slice 3
  xor(S[3], B[3], C[3]);
  and(co, B[3], C[3]);
endmodule
module compare_with_5(input [3:0]A, output Gt);
  wire i, j;
  or(i, A[0], A[1]);
  and(j, i, A[2]);
  or(Gt, j, A[3]);
endmodule
module four_bit_register_v2 (input [3:0]A, input RST, CLK, output [3:0]Q);
  genvar i;
  generate
    for(i = 0; i < 4; i = i+1)
    begin
      D_type_flip_flop_with_rst flipFlop(A[i], RST, CLK, Q[i]);
    end
  endgenerate
endmodule
module D_type_flip_flop_with_rst(input D, RST, CLK, output Q);
  wire i;
  and(i, ~RST, D);
  D_type_flip_flop flipFlop(i, CLK, Q);
endmodule
module D_type_flip_flop(input D, CLK, output Q);
  wire Qo;
  clocked_D_latch dLatch(D, CLK, Qo);
  clocked_D_latch secondDLatch(Qo, ~CLK, Q);
endmodule
module clocked_D_latch(input D, CLK, output Q);
  wire Dnot;
  not (Dnot, D);
  clocked_SR_latch srLatch(D, Dnot, CLK, Q);
endmodule 
module clocked_SR_latch(input S, R, CLK, output Q);
  wire i, j, Q_;
  nand (i, S, CLK);
  nand (j, R, CLK);
  nand (Q_, j, Q);
  nand (Q, i, Q_);
endmodule