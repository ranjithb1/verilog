`timescale 1ns / 1ps

module tb_odd_count_parity_fsm;
    reg        clk;
    reg        rst_n;
    reg  [1:0] din;
    wire       is_odd;

    odd_count_parity_fsm uut (
        .clk(clk),
        .rst_n(rst_n),
        .din(din),
        .is_odd(is_odd)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst_n = 0;
        din   = 2'd0;
        #12 rst_n = 1;

        @(negedge clk) din = 2'd2;
        @(negedge clk) din = 2'd1;
        @(negedge clk) din = 2'd0;
        @(negedge clk) din = 2'd3;
        @(negedge clk) din = 2'd3;

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | din=%d | is_odd=%b (0:EVEN, 1:ODD)", $time, din, is_odd);
    end
endmodule
