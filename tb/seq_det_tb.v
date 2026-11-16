
module seq_det_tb;

parameter CYCLE = 10;

reg clk,reset,din;
wire dout;

seq_det dut (.clk(clk),.reset(reset),.din(din),.dout(dout));

initial begin
    clk = 1'b0;
    forever #(CYCLE/2) clk = ~clk;
end

task init;
begin
  din = 1'b0;
end
endtask

task RESET;
begin
  @(negedge clk)
  reset = 1'b1;
  #(CYCLE);
  @(negedge clk)
  reset = 1'b0;
end
endtask

task st;
    input data;
begin
    @(negedge clk);
    din = data;
end
endtask

initial begin
    $monitor("time=%0t clk=%b reset=%b din=%b dout=%b",$time, clk, reset, din, dout);
end

initial begin
    init;
    RESET;
    st(1'b1);
    st(1'b0);
    st(1'b1);
    st(1'b0);
    st(1'b1);
    repeat (2) @(negedge clk);
  $finish;
end
endmodule
