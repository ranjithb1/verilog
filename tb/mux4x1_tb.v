
module mux4_tb;

reg i0, i1, i2, i3, s1, s0;
wire y;

mux4x1 dut(.i0(i0), .i1(i1), .i2(i2), .i3(i3),.s1(s1), .s0(s0), .y(y));

task init;
begin
    {i0, i1, i2, i3, s1, s0} = 6'b000000;
end
endtask

task dr;
   input t0, t1, t2, t3, ts0, ts1;
    begin
   i0 = t0; i1 = t1; i2 = t2; i3 = t3; s0 = ts0; s1 = ts1;
    end
endtask

initial begin
    $monitor("time=%0t i0=%b i1=%b i2=%b i3=%b s1=%b s0=%b y=%b", $time, i0, i1, i2, i3, s1, s0, y);

  init;

  dr(1,0,0,0,0,0); #10;
  dr(0,1,0,0,1,0); #10;
  dr(0,0,1,0,0,1); #10;
  dr(0,0,0,1,1,1); #10;
  
    $finish;
end

endmodule