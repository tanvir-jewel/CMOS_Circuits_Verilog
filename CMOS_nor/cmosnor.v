module cmosnor(f_nor, a, b);
  input a,b;
  output f_nor;
  wire w_p;
  
  supply1 vdd;
  supply0 gnd;
  
  // pmos (drain, source, gate);
  pmos p1(w_p, vdd, a);
  pmos p2(f_nor, w_p, b);
  // nmos (drain, source, gate);
  nmos n1(f, gnd, a);
  nmos n2(f, gnd, b);
endmodule

`timescale 1ns/1ns
module cmosnor_tb;
  reg a,b;
  wire f_nand;
  cmosnor cmos_nor(f_nor, a, b);
  initial begin
    	a = 0; b = 0;
    #1 a = 0; b = 1;
    #1 a = 1; b = 0;
    #1 a = 1; b = 1;
    #1 $finish;
  end
  initial begin 
    $monitor("%2d:\ta = %b\tb = %b\f_nand = %b", $time,a,b,f_nor);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
