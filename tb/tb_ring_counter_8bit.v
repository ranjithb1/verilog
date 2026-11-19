`timescale 1ns / 1ps

module tb_ring_counter_8bit;
reg clk, rst_n;
wire [7:0] ring_out;

ring_counter_8bit uut(clk, rst_n, ring_out);

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t | rst_n=%b | ring_out=%b", $time, rst_n, ring_out);

    clk = 0;
    rst_n = 0;
    #15 rst_n = 1;

    #160;
    $finish;
end
endmodule
