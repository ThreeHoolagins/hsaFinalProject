// 4 option mux
module mux4(input  logic [15:0] d0, d1, d2, d3,
            input  logic [1:0] s,
            output logic [15:0] y);

   assign y = s[1] ? (s[0] ? d3 : d2)
                   : (s[0] ? d1 : d0);
endmodule

module mux2(input  logic [15:0] d0, d1,
            input  logic s,
            output logic [15:0] y);

   assign y = s ? d1 : d0;

endmodule

module reg16(input logic [15:0] D,
             input logic clk, reset, store,
             output logic [15:0] Y);

    always @(posedge clk)
      if (reset)
        Y <= 16'b0;
      else if (store)
        Y <= D;

endmodule

module onesComp(input logic [15:0] A, output logic [15:0] out);
    //assign A = A^16'b111111111111;
    assign out = ~A;

endmodule


module half_adder (Cout, Sum, A, B);

   input logic A,B;
   output logic Sum,Cout;

   xor xor1(Sum,A,B);
   and and1(Cout,A,B);

endmodule // ha


module full_adder (Cout, Sum, A, B, Cin);

   input logic A,B,Cin;
   output logic Sum,Cout;
   wire S1,C1,C2;

   half_adder ha1(C1,S1,A,B);
   half_adder ha2(C2,Sum,S1,Cin);
   or or1(Cout,C1,C2);

endmodule // fa

module xor16(input logic [15:0] A, B, output logic [15:0] result);
  assign result[0] = A[0] ^ B[0];
  assign result[1] = A[1] ^ B[1];
  assign result[2] = A[2] ^ B[2];
  assign result[3] = A[3] ^ B[3];
  assign result[4] = A[4] ^ B[4];
  assign result[5] = A[5] ^ B[5];
  assign result[6] = A[6] ^ B[6];
  assign result[7] = A[7] ^ B[7];
  assign result[8] = A[8] ^ B[8];
  assign result[9] = A[9] ^ B[9];
  assign result[10] = A[10] ^ B[10];
  assign result[11] = A[11] ^ B[11];
  assign result[12] = A[12] ^ B[12];
  assign result[13] = A[13] ^ B[13];
  assign result[14] = A[14] ^ B[14];
  assign result[15] = A[15] ^ B[15];
endmodule
module sixteenbitrca (input logic [15:0] A, B, input logic Cin, output logic Cout, output logic [15:0] sum);
  logic c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;

  full_adder add1(c1, sum[0],A[0],B[0],Cin);
  full_adder add2(c2, sum[1],A[1],B[1],c1);
  full_adder add3(c3, sum[2],A[2],B[2],c2);
  full_adder add4(c4, sum[3],A[3],B[3],c3);
  full_adder add5(c5, sum[4],A[4],B[4],c4);
  full_adder add6(c6, sum[5],A[5],B[5],c5);
  full_adder add7(c7, sum[6],A[6],B[6],c6);
  full_adder add8(c8, sum[7],A[7],B[7],c7);
  full_adder add9(c9, sum[8],A[8],B[8],c8);
  full_adder add10(c10, sum[9],A[9],B[9],c9);
  full_adder add11(c11, sum[10],A[10],B[10],c10);
  full_adder add12(c12, sum[11],A[11],B[11],c11);
  full_adder add13(c13, sum[12],A[12],B[12],c12);
  full_adder add14(c14, sum[13],A[13],B[13],c13);
  full_adder add15(c15, sum[14],A[14],B[14],c14);
  full_adder add16(Cout, sum[15],A[15],B[15],c15);

endmodule // sixteenbitrca
