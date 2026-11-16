module vending_tb;
reg clk,rst,a,b;
wire x,y;

vending dut(.clk(clk),.rst(rst),.a(a),.b(b),.x(x),.y(y));

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
$monitor("time=%0t rst=%b a=%b b=%b x=%b y=%b",$time,rst,a,b,x,y);

rst=1; a=0; b=0;
#10 rst=0;

a=0; b=1;
#10 a=1; b=0;
#10 a=0; b=0;
#10 a=1; b=0;
#10 a=0; b=0;
#10 a=0; b=1;
#10 a=0; b=1;
#10 a=0; b=0;

#20 $finish;
end
endmodule