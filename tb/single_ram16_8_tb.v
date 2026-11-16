
module single_ram16_8_tb;

    reg [7:0] din;
    reg clk, reset, we, re;
    reg [3:0] addr;
    wire [7:0] dout;

    single_ram16_8s dut (.din(din),.dout(dout),.clk(clk),.reset(reset),.we(we),.re(re),.addr(addr));

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
        we = en;
        re = 0;
    end
    endtask

    task read(input [3:0] a, input en);
    begin
        @(negedge clk);
        addr = a;
        re = en;
        we = 0;
    end
    endtask

    initial begin
        din = 0;
        reset = 0;
        we = 0;
        re = 0;
        addr = 0;

 $monitor("Time=%0t reset=%b we=%b re=%b addr=%d din=%h dout=%h",
                 $time, reset, we, re, addr, din, dout);
   rst;

   write(8'b11110000, 4'd8, 1'b1);
   write(8'b00001111, 4'd1, 1'b1);

   read(4'd8, 1'b1);
   read(4'd1, 1'b1);

    @(negedge clk);
    re = 0;
    we = 0;

        #10;
        $finish;
    end

endmodule
