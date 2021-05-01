`timescale 1ns / 1ps
module testBench();

  // Set Constants
  logic [15:0] IA0, IA1, IA2, IA3;
  // Inputs
  logic [15:0] A, B;
  // Outputs
  logic [15:0] Q, R;
  // Control logic
  logic [1:0] rightMux;
  logic clk, reset, kSave, nSave, dSave, kNextSel;

  divider dut(A,B,IA0,IA1,IA2,IA3,clk,reset,kSave,nSave,dSave,kNextSel,rightMux,Q,R);
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
    //Setup for logic
    reset = 0;

    // Set input values
    A = $random; B = $random;
    // Cycle 1 Control logic, D*IA
    kSave = 1; dSave = 1; nSave = 0; rightMux = 2'b01; kNextSel = 1'b1;
    #20;
    // Cycle 2 control logic, K*IA, Store cycle 1..?
    kSave = 0; dSave = 0; nSave = 1; rightMux = 2'b00;
    #20;
    // Cycle 3 control logic, D*k1, Store cycle 1..?
    kSave = 1; dSave = 1; nSave = 0; rightMux = 2'b00; kNextSel = 1'b0;
    #20;
    // Cycle 4 control logic, K*k1, Store cycle 1..?
    kSave = 0; dSave = 0; nSave = 1; rightMux = 2'b00;
    #20;
    // Cycle 3 control logic, D*k2, Store cycle 1..?
    kSave = 1; dSave = 1; nSave = 0; rightMux = 2'b00;
    #20;
    // Cycle 4 control logic, K*k2, Store cycle 1..?
    kSave = 0; dSave = 0; nSave = 1; rightMux = 2'b00;
    #20;
    // Cycle 3 control logic, D*k3, Store cycle 1..?
    kSave = 1; dSave = 1; nSave = 0; rightMux = 2'b00;
    #20;
    // Cycle 4 control logic, K*k3, Store cycle 1..?
    kSave = 0; dSave = 0; nSave = 1; rightMux = 2'b00;
    #20;
    // Cycle 3 control logic, D*k4, Store cycle 1..?
    kSave = 1; dSave = 1; nSave = 0; rightMux = 2'b00;
    #20;
    // Cycle 4 control logic, K*k4, Store cycle 1..?
    kSave = 0; dSave = 0; nSave = 1; rightMux = 2'b00;
    #20;

    // Reset
    reset = 1;
    // When we are done, skip to the next set of multiples
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
