module cmosnot(f, a);
  input a;
  output f;
  supply1 vdd;
  supply0 gnd;
  pmos p1(f, vdd, a);
  nmos n1(f, gnd, a);
endmodule

`timescale 1ns/1ns
module cmosnot_tb;
  reg a;
  wire f;
  cmosnot cmos_not(f,a);
  initial begin
    	a = 0;
    #1 a = 1;
    #1 a = 0;
    #1 $finish;
  end
  initial begin 
    $monitor("%2d:\ta = %b\tf = %b", $time,a,f);
  end
endmodule
