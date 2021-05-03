module mux2x1_3s(a0, a1, s, y); // multiplexer using tri-state gates
  input a0, a1, s;
  output y;
  
  // bufif0 (out, in, ctl); 	// tri-state buffer: ctl==0: out=in;
  bufif0(y, a0, s); 			// ctl == 1: out = high-impedance;
  
  // bufif1 (out, in, ctl);		// tri-state buffer: ctl==1: out=in;
  bufif1(y, a1, s);				// ctl == 0: out = high-impedance;
  
endmodule


`timescale 1ns/1ns
module mux2x1_3s_tb;
  reg a0, a1,s;
  wire y;
  
  mux2x1_3s mux2x1 (a0,a1,s,y);
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
