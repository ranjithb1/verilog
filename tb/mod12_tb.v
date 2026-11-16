
module mod12_tb;

parameter CYCLE = 10;

reg clk, reset, load;
reg [3:0] data_in;
wire [3:0] count;

mod12_counter uut(.clk(clk), .reset(reset), .load(load), .data_in(data_in), .count(count));

initial begin
    clk = 1'b0;
    forever #(CYCLE/2) clk = ~clk;
end

task init;
    begin
        reset = 1;
        load = 0;
        data_in = 4'b0000;
    end
endtask

task st(input rst, input ld, input [3:0] din);
    begin
        @(negedge clk);
        reset = rst;
        load = ld;
        data_in = din;
    end
endtask

initial begin
    $monitor("time=%0t clk=%b reset=%b load=%b data_in=%b count=%b decimal=%0d",
              $time, clk, reset, load, data_in, count, count);

    init;

    st(0, 0, 4'b0000);  // Start counting
    st(0, 0, 4'b0000);  // Count
    st(0, 0, 4'b0000);  // Count
    st(0, 1, 4'b0101);  // Load 5
    st(0, 0, 4'b0000);  // Count from 5
    st(0, 1, 4'b1110);  // Invalid load: load 0
    st(0, 1, 4'b1001);  // Load 9
    st(0, 0, 4'b0000);  // Count 10
    st(0, 0, 4'b0000);  // Count 11
    st(0, 0, 4'b0000);  // Wrap to 0
    st(1, 0, 4'b0000);  // Reset

    #10;
    $finish;
end

endmodule
