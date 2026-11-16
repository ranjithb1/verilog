
`timescale 1ns/1ps

module dual_ram8_16a_tb;

    reg [15:0] din;
    reg clk, reset, w_e, r_e;
    reg [2:0] w_a, r_a;
    wire [15:0] dout;

    dual_ram8_16a dut (
        .din(din),
        .dout(dout),
        .clk(clk),
        .reset(reset),
        .w_e(w_e),
        .r_e(r_e),
        .w_a(w_a),
        .r_a(r_a)
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

    task write(input [15:0] data,
               input [2:0] addr,
               input en);
    begin
        @(negedge clk);
        din = data;
        w_a = addr;
        w_e = en;
        @(negedge clk);
        w_e = 0;
    end
    endtask

    task read(input [2:0] addr, input en);
    begin
        r_a = addr;
        r_e = en;
        #1;
    end
    endtask

    initial begin
        din = 0;
        reset = 0;
        w_e = 0;
        r_e = 0;
        w_a = 0;
        r_a = 0;

        $monitor("Time=%0t reset=%b w_e=%b w_a=%d din=%h r_e=%b r_a=%d dout=%h",
                 $time, reset, w_e, w_a, din, r_e, r_a, dout);

        rst;

        write(16'hABCD, 3'd5, 1'b1);
        write(16'h1234, 3'd2, 1'b1);

        read(3'd5, 1'b1);
        read(3'd2, 1'b1);
        read(3'd0, 1'b0);

        #10;
        $finish;
    end

endmodule
