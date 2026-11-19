`timescale 1ns / 1ps

module tb_ring_counter_div2;
    reg        clk;
    reg        rst_n;
    wire [7:0] ring_out;

    ring_counter_div2 uut (
        .clk      (clk),
        .rst_n    (rst_n),
        .ring_out (ring_out)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | clk=%b | ring_out=%b", $time, clk, ring_out);

        clk   = 0;
        rst_n = 0;
        #12;
        rst_n = 1;

        #200;
        $finish;
    end
endmodule
