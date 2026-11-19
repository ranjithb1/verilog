`timescale 1ns / 1ps

module tb_fibonacci_gen;
    reg        clk;
    reg        rst_n;
    wire [7:0] fib_out;
    wire       done;

    fibonacci_gen uut (
        .clk(clk),
        .rst_n(rst_n),
        .fib_out(fib_out),
        .done(done)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst_n = 0;
        #12 rst_n = 1;
        wait (done == 1'b1);
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | fib_out=%3d | done=%b", $time, fib_out, done);
    end
endmodule
