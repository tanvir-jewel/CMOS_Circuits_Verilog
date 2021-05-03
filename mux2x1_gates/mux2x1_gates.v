module mux2x1_gates(a0, a1, s, y); 
  input a0, a1, s;
  output y;
  
  wire sn, a0_sn, a1_sn;
  
  not i0(sn, s);
  and i1(a0_sn, a0, sn);
  and i2(a1_sn, a1, s);
  or i3(y, a0_sn, a1_s);
  
endmodule


`timescale 1ns/1ns
module mux2x1_gates_tb;
  reg a0, a1,s;
  wire y;
  
  mux2x1_gates mux2x1 (a0,a1,s,y);
  initial begin
    	a0 = 0; a1 = 0; s = 0;
    $display("time\ts\ta1\ta0\ty");
    $monitor("%2d:\t%b\t%b\t%b\t%b", $time, s, a1, a0, y);
    #8 $finish;
  end
  
  always #1 a0 = !a0;
  always #2 a1 = !a1;
  always #4 s = !s;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
