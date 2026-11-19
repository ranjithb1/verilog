`timescale 1ns / 1ps

module tb_seq_det_1011;
    reg  clk;
    reg  rst_n;
    reg  din;
    wire dout;

    seq_det_1011 uut (
        .clk   (clk),
        .rst_n (rst_n),
        .din   (din),
        .dout  (dout)
    );

    always #5 clk = ~clk;

    task send_bit(input bit b);
        begin
            @(negedge clk);
            din = b;
        end
    endtask

    initial begin
        clk   = 1'b0;
        rst_n = 1'b0;
        din   = 1'b0;

        $monitor("Time = %0t | state = %b | din = %b | dout = %b", 
                  $time, uut.state, din, dout);

        #15 rst_n = 1'b1;

        // Stream: 1 -> 0 -> 1 -> 1 (Detect) -> 0 -> 1 -> 1
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1); // Pulse expected here

        send_bit(0);
        send_bit(1);
        send_bit(1); // Incomplete sequence

        // Complete a second match: 1 -> 0 -> 1 -> 1
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1); // Pulse expected here

        #20;
        $finish;
    end
endmodule
