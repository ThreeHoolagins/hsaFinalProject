`timescale 1ns / 1ps
`include "spares.sv"
module testBench();

  logic [15:0] A, B, C, D;
  logic [1:0] S;
  logic clk, reset, regAPush;
  logic [31:0] outFromMult, outFromMux, outFromReg;


  //multiplier dut(outFromMult,A,B);
  //mux4 dut(A,B,C,D,S,outFromMux);
  //reg16 dut(A,clk,reset,regAPush,outFromReg);


  // 2 ns clock
  initial begin
    clk = 1'b1;
    forever #10 clk = ~clk;
  end

  initial begin

/*
    Tests for multiplier
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100
*/

/*
    Test Set for mux4
    A = $random; B = $random; C = $random; D = $random;
    S[1] = 0; S[0] = 0; #100;
    A = $random; B = $random; C = $random; D = $random;
    S[1] = 0; S[0] = 1; #100;
    A = $random; B = $random; C = $random; D = $random;
    S[1] = 1; S[0] = 0; #100;
    A = $random; B = $random; C = $random; D = $random;
    S[1] = 1; S[0] = 1; #100;
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
