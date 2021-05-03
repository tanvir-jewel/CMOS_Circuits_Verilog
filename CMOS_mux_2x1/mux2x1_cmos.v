module mux2x1_cmos(a0, a1, s, y);
  input a0, a1, s;
  output y;
  
  // internal wire, output of cmosnot
  wire sn;
  
  // cmos invert: (out, in);
  cmosnot inv(sn,s); 
  
  // cmoscmos (drain, source, n_gate, p_gate);
  cmoscmos c0(y, a0, s, sn);
  cmoscmos c1(y, a1, sn, s);

endmodule

module cmoscmos(drain, source, n_gate, p_gate); // cmos gate
  input source, n_gate, p_gate;
  output drain;
  pmos p1(drain, source, p_gate);	// pmos name (drain, source, gate);
  nmos n1(drain, source, n_gate);	// nmos name (drain, source, gate);
endmodule


module cmosnot(f, a);
  input a;
  output f;
  supply1 vdd;
  supply0 gnd;
  pmos p1(f, vdd, a);
  nmos n1(f, gnd, a);
endmodule

`timescale 1ns/1ns
module mux2x1_cmos_tb;
  reg a0, a1,s;
  wire y;
  
  mux2x1_cmos mux2x1 (a0,a1,s,y);
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
