
`timescale 1ns/1ps

module single_ram16_8a_tb;

    reg [7:0] din;
    reg clk, reset, w_e, r_e;
    reg [3:0] addr;
    wire [7:0] dout;

    single_ram16_8a dut (
        .din(din),
        .dout(dout),
        .clk(clk),
        .reset(reset),
        .w_e(w_e),
        .r_e(r_e),
        .addr(addr)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    task rst;
    begin
        @(negedge clk);
        reset = 1;
        @(negedge clk);
        reset = 0;
    end
    endtask

    task write(input [7:0] data,
               input [3:0] a,
               input en);
    begin
        @(negedge clk);
        din = data;
        addr = a;
        w_e = en;
        @(negedge clk);
        w_e = 0;
    end
    endtask

    task read(input [3:0] a, input en);
    begin
        addr = a;
        r_e = en;
        #1;
    end
    endtask

    initial begin
        din = 0;
        reset = 0;
        w_e = 0;
        r_e = 0;
        addr = 0;

        $monitor("Time=%0t reset=%b w_e=%b r_e=%b addr=%d din=%h dout=%h",
                 $time, reset, w_e, r_e, addr, din, dout);

        rst;

        write(8'b11110000, 4'd8, 1'b1);
        write(8'b00001111, 4'd1, 1'b1);

        read(4'd8, 1'b1);
        read(4'd1, 1'b1);
        read(4'd0, 1'b0);

        #10;
        $finish;
    end

endmodule
