`timescale 1ns / 1ps

module tb_shift_reg_div3;
    reg        clk;
    reg        rst_n;
    reg        din;
    wire [3:0] q;

    shift_reg_div3 uut (
        .clk   (clk),
        .rst_n (rst_n),
        .din   (din),
        .q     (q)
    );

    always #5 clk = ~clk;

    task apply_data(input bit d_in);
        begin
            din = d_in;
            #10;
        end
    endtask

    initial begin
        clk   = 1'b0;
        rst_n = 1'b0;
        din   = 1'b0;

        $monitor("Time = %0t | clk_cnt = %0d | din = %b | q = %b", 
                  $time, uut.clk_cnt, din, q);

        #15 rst_n = 1'b1;

        // Drive a test bitstream: 1, 1, 0, 1, 0, 1, 1, 0, 0
        apply_data(1);
        apply_data(1);
        apply_data(0);
        apply_data(1);
        apply_data(0);
        apply_data(1);
        apply_data(1);
        apply_data(0);
        apply_data(0);
        apply_data(1);
        apply_data(1);
        apply_data(1);

        #40;
        $finish;
    end
endmodule
