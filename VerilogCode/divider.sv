
module divider (input logic [15:0] N,D,IA0,IA1,IA2,IA3,
                input logic clk,
                output logic [15:0] quotient, remainder);
  // take in N, D, clk, IA0,IA1,IA2,IA3, and output remainder and quotient
  // establish our internal logic
  logic [31:0] multOut;
  logic [15:0] kNext, IA, kn, multRight, nNext, dNext, onesOut;
  logic regA, regB, regC, muxSelA;
  logic [1:0] muxSelB;

  mux4 iaMux(IA0, IA1, IA2, IA3, D[14:13], IA);
  mux2 knextMux(kNext, IA, 1'b1, kn);
  mux4 NorDSel(N, D, nNext, dNext, 2'b00, multRight);

  multiplier mult(multOut, kn, multRight);

  onesComp onesConv(multOut[15:0],onesOut);

  reg16 reg1(onesOut, clk, 1'b0, 1'b1, quotient);

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
