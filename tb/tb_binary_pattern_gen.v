`timescale 1ns / 1ps

module tb_binary_pattern_gen;
    reg        clk;
    reg        rst_n;
    wire [7:0] dout;

    binary_pattern_gen uut (
        .clk(clk),
        .rst_n(rst_n),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst_n = 0;
        #12 rst_n = 1;
        #100 $finish;
    end

    initial begin
        $monitor("Time=%0t | dout=%b", $time, dout);
    end
endmodule
