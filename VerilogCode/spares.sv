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
    assign A = A^16'bFFFF;
    full_adder(A,16'b2);
    assign out = A

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
