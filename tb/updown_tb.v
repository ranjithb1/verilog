
module updown_tb;

parameter CYCLE = 10;

reg clk, reset, load, mode;
reg [3:0] din;
wire [3:0] count;

up_down_counter uut(.clk(clk), .reset(reset), .load(load), .mode(mode), .din(din), .count(count));

initial begin
    clk = 1'b0;
    forever #(CYCLE/2) clk = ~clk;
   
end

task init;
    begin
        reset = 1;
        load = 0;
        mode = 1;
        din = 4'b0000;
    end
endtask

task st(input rst, input ld, input m, input [3:0] d_in);
    begin
        @(negedge clk);
        reset = rst;
        load = ld;
        mode = m;
        din = d_in;
    end
endtask

initial begin
    $monitor("time=%0t clk=%b reset=%b load=%b mode=%b din=%b count=%b decimal=%0d",
              $time, clk, reset, load, mode, din, count, count);

    init;

    st(0, 0, 1, 4'b0000);  // Count up
    st(0, 1, 1, 4'b1010);  // Load 10
    st(0, 0, 1, 4'b0000);  // Count up to 11
    st(0, 0, 0, 4'b0000);  // Count down to 10
    st(0, 0, 0, 4'b0000);  // Count down to 9
    st(0, 1, 0, 4'b0000);  // Load 0
    st(0, 0, 0, 4'b0000);  // Underflow to 15
    st(0, 0, 1, 4'b0000);  // Count up to 0
    st(1, 0, 1, 4'b0000);  // Reset

    #10;
    $finish;
end

endmodule
