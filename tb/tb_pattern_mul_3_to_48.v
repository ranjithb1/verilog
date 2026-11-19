`timescale 1ns / 1ps

module tb_pattern_mul_3_to_48;
    reg        clk;
    reg        rst_n;
    wire [5:0] dout;

    pattern_mul_3_to_48 uut (
        .clk(clk),
        .rst_n(rst_n),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst_n = 0;
        #12 rst_n = 1;
        #120 $finish;
    end

    initial begin
        $monitor("Time=%0t | dout=%0d", $time, dout);
    end
endmodule
