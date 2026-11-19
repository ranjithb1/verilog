`timescale 1ns / 1ps

module tb_johnson_counter_4bit;
    reg        clk;
    reg        rst_n;
    wire [3:0] q;

    johnson_counter_4bit uut (
        .clk   (clk),
        .rst_n (rst_n),
        .q     (q)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 1'b0;
        rst_n = 1'b0;

        $monitor("Time = %0t | rst_n = %b | q = %b (%0d)", $time, rst_n, q, q);

        #15 rst_n = 1'b1;

        // Run for 10 full clock cycles (covers all 8 states)
        #100;

        // Reset check
        #5 rst_n = 1'b0;
        #10 rst_n = 1'b1;
        #30;

        $finish;
    end
endmodule
