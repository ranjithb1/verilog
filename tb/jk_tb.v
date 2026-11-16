

module jk_tb;
    reg clk, j, k;
    wire q, qb;

    jk #(3) dut(clk, j, k, q, qb);

    always #5 clk = ~clk;

    initial begin
        clk=0; j=0; k=0;
        #10 j=1; k=0;
        #10 j=0; k=1;
        #10 j=1; k=1;
        #20 $finish;
    end
endmodule
