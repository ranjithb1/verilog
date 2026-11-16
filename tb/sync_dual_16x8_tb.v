

module sync_dual_16x8_tb;

    reg [7:0] din;
    reg clk, reset, we, re;
    reg [3:0] wa, ra;
    wire [7:0] dout;

    sync_dual_16x8 dut (.din(din),.dout(dout),.clk(clk),.reset(reset),.we(we),.re(re),.wa(wa),.ra(ra) );

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
               input [3:0] addr,
               input en);
    begin
        @(negedge clk);
        din = data;
        wa = addr;
        we = en;
    end
    endtask

    task read(input [3:0] addr, input en);
    begin
        @(negedge clk);
        ra = addr;
        re = en;
    end
    endtask

    initial begin
        din = 0;
        reset = 0;
        we = 0;
        re = 0;
        wa = 0;
        ra = 0;

        $monitor("Time=%0t reset=%b w_e=%b w_a=%d din=%h r_e=%b r_a=%d dout=%h",
                 $time, reset, w_e, w_a, din, r_e, r_a, dout);

        rst;

        write(8'b11110000, 4'd8, 1'b1);
        write(8'b00001111, 4'd1, 1'b1);
        write(8'b11111111, 4'd0, 1'b0);

        read(4'd8, 1'b1);
        read(4'd1, 1'b1);
        read(4'd0, 1'b0);

        @(negedge clk);
        we = 0;
        re = 0;

        #10;
        $finish;
    end

endmodule
