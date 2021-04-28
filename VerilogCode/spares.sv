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
