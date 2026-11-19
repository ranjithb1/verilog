`timescale 1ns / 1ps

module tb_smallest_so_far_fsm;
    reg        clk;
    reg        rst_n;
    reg  [1:0] din;
    wire [1:0] dout;

    smallest_so_far_fsm uut (
        .clk(clk),
        .rst_n(rst_n),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst_n = 0;
        din   = 2'd0;
        #12 rst_n = 1;

        @(negedge clk) din = 2'd3;
        @(negedge clk) din = 2'd2;
        @(negedge clk) din = 2'd1;
        @(negedge clk) din = 2'd3;
        @(negedge clk) din = 2'd0;
        @(negedge clk) din = 2'd2;
        @(negedge clk) din = 2'd1;

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | din=%d | dout=%d", $time, din, dout);
    end
endmodule
