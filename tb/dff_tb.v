
module ff_tb;
    parameter CYCLE = 10;
    reg clk, rst, din;
    wire q, qb;

    dff dut (.clk(clk), .rst(rst), .din(din), .q(q), .qb(qb));

    always begin
        #(CYCLE/2) clk = 1'b0;
        #(CYCLE/2) clk = ~clk;
    end

    task rstin;
        begin
            @(negedge clk) rst = 1'b1;
            @(negedge clk) rst = 1'b0;
        end
    endtask

 task din_task;
    input i;
    begin
       @(negedge clk);
         din = i;
        end
    endtask

 initial $monitor("Time=%0t clk=%b rst=%b din=%b q=%b qb=%b", $time, clk, rst, din, q, qb);

    initial begin
        clk = 1'b0; rst = 1'b0; din = 1'b0;
        rstin;
        din_task(1'b1);
        din_task(1'b0);
        din_task(1'b1);
        din_task(1'b0);
        #(CYCLE);
        $finish;
    end
endmodule
