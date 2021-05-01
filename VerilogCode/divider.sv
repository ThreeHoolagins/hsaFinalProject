
module divider (input logic [15:0] N,D,IA0,IA1,IA2,IA3,
                input logic clk, reset, kSave, nSave, dSave, kNextSel,
                input logic [1:0] muxSelB,
                output logic [15:0] quotient, remainder);
  // take in N, D, clk, IA0,IA1,IA2,IA3, and output remainder and quotient
  // establish our internal logic
  logic [31:0] multOut;
  logic [15:0] kNext, IA, kn, multRight, nNext, dNext, onesOut;
  logic regA, regB, regC, muxSelA;
  //logic [1:0] muxSelB;

  mux4 iaMux(IA0, IA1, IA2, IA3, D[14:13], IA);
  mux2 knextMux(kNext, IA, kNextSel, kn);
  mux4 NorDSel(N, D, nNext, dNext, muxSelB, multRight);

  multiplier mult(multOut, kn, multRight);

  reg16 nNextReg(multOut[15:0], clk, reset, nSave, nNext);
  reg16 outputReg(nNext, clk, reset, nSave, quotient);
  reg16 dNextReg(multOut[15:0], clk, reset, dSave, dNext);

  onesComp onesConv(multOut[15:0],onesOut);
  reg16 kNextReg(onesOut, clk, reset, kSave, kNext);

  /*

    to pick between knext, use mux2(kNext, IA, muxSelA, k);

    to pick between N,D,Mn,and use mux4(N, D, nNext, dNext, muxSelB, multRight);

    to use the multiplier, use multiplier(multOut, k, multRight);

    to use the registers, use reg16(multOut[15:0], clk, reset, regX,nNext | dNext | kNext);

    for the one's compliment, use 2 - multOut[15:0] + ulp

    Questions:
    Do i set this up in seriel?
      no it's all synconus
    Do i wire the connections instead of holding inbetween vars?
      no
    How do xor large armounts of vars?
     ^ as long as they are the same size

    mult m1(A, B, P);
flopenr reg1 (clock, reset, EN, P, P_out);

  */
endmodule // divider
