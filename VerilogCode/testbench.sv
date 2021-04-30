`timescale 1ns / 1ps
module testBench();

  logic [15:0] A, B, C, D, IA0, IA1, IA2, IA3, Q, R;
  logic [1:0] S;
  logic clk, reset, regAPush;
  logic [31:0] outFromMult, outFromMux, outFromReg;

  divider dut(A,B,IA0,IA1,IA2,IA3,clk,Q,R);
  //multiplier dut(outFromMult,A,B);
  //mux4 dut(A,B,C,D,S,outFromMux);
  //reg16 dut(A,clk,reset,regAPush,outFromReg);

  // Define IA
  initial begin
    IA0 = 16'b1110011001100110; // .9
    IA1 = 16'b1011101011100001; // .73
    IA2 = 16'b1001111010111000; // .62
    IA3 = 16'b1000101000111101; // .54
  end

  // 2 ns clock
  initial begin
    clk = 1'b1;
    forever #10 clk = ~clk;
  end

  initial begin
    //Tests for divider
    A = $random; B = $random; #20;
    A = $random; B = $random; #20;
    A = $random; B = $random; #20;
    A = $random; B = $random; #20;
    A = $random; B = $random; #20;
/*
    Tests for multiplier
    A = $random; B = $random; #20;
    A = $random; B = $random; #20;
    A = $random; B = $random; #20;
    A = $random; B = $random; #20;
    A = $random; B = $random; #20;
*/

/*
    Test Set for mux4
    A = $random; B = $random; C = $random; D = $random;
    S[1] = 0; S[0] = 0; #20;
    A = $random; B = $random; C = $random; D = $random;
    S[1] = 0; S[0] = 1; #20;
    A = $random; B = $random; C = $random; D = $random;
    S[1] = 1; S[0] = 0; #20;
    A = $random; B = $random; C = $random; D = $random;
    S[1] = 1; S[0] = 1; #20;
*/

/*
    Tests for register
    A = $random; reset = 0; regAPush = 0; #20;
    A = $random; reset = 0; regAPush = 1; #20;
    A = $random; reset = 1; regAPush = 0; #20;
    A = $random; reset = 1; regAPush = 1; #20;
*/

  end

endmodule
