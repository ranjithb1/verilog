

module tff_tb;
    reg clk, rst, t;
    wire q, qb;

    tff dut(clk, rst, t, q, qb);

    always #5 clk = ~clk;

    initial begin
        clk=0; rst=1; t=0;
        #10 rst=0;
        #10 t=1;
        #20 t=0;
        #10 t=1;
        #20 $finish;
    end
endmodule
