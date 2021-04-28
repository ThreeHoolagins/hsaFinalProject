`timescale 1ns / 1ps
module testBench();

  logic [15:0] A, B;
  logic clk;
  logic [31:0] out;

  multiplier dut(out,A,B);

  // 2 ns clock
  initial begin
    clk = 1'b1;
    forever #50 clk = ~clk;
  end

  initial begin

    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;
    A = $random; B = $random; #100;



  end

endmodule
