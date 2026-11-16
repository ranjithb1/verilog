module clk_buf_tb;
reg mclk;
wire bclk;
integer t1, t2, t3, t4, t5, t6;

clk_buf dut(.mclk(mclk), .bclk(bclk));

initial begin
mclk = 0;
forever #5 mclk = ~mclk;
end

task measure_clk;
begin
@(posedge mclk);
t1 = $time;
@(negedge mclk);
t3 = $time;
end
endtask

task measure_bclk;
begin
@(posedge bclk);
t2 = $time;
@(negedge bclk);
t4 = $time;
end
endtask

initial begin
fork
measure_clk;
measure_bclk;

join

if ((t1 == t2) && (t3 == t4))
$display("PHASE IS SAME");
else
$display("PHASE IS NOT SAME");

t5 = t3 - t1;
t6 = t4 - t2;

if (t5 == t6)
$display("FREQ IS SAME");
else
$display("FREQ IS NOT SAME");


#10;
$finish;
end

endmodule