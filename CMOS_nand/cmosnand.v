module cmosnand(f_nand, a, b);
  input a,b;
  output f_nand;
  wire w_n;
  
  supply1 vdd;
  supply0 gnd;
  pmos p1(f_nand, vdd, a);
  pmos p2(f_nand, vdd, b);
  nmos n1(f_nand, w_n, a);
  nmos n2(w_n, gnd, b);
endmodule


`timescale 1ns/1ns
module cmosnand_tb;
  reg a,b;
  wire f_nand;
  cmosnand cmos_nand(f_nand, a, b);
  initial begin
    	a = 0; b = 0;
    #1 a = 0; b = 1;
    #1 a = 1; b = 0;
    #1 a = 1; b = 1;
    #1 $finish;
  end
  initial begin 
    $monitor("%2d:\ta = %b\tb = %b\f_nand = %b", $time,a,b,f_nand);
  end
endmodule
