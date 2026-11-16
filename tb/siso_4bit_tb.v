
module siso_4bit_tb;

    parameter CYCLE = 10;

    reg clk, reset, serial_in;
    wire serial_out;
    integer i;
    reg [7:0] data;

    siso_4bit uut (.clk(clk),.reset(reset),.serial_in(serial_in),.serial_out(serial_out));

    initial begin
        clk = 0;
        forever #(CYCLE/2) clk = ~clk;
    end

    task init;
        begin
            reset = 1;
            serial_in = 0;
            data = 8'b10110010;
        end
    endtask

 initial begin
   $monitor("time=%0t clk=%b reset=%b serial_in=%b q=%b serial_out=%b", $time, clk, reset, serial_in, uut.q, serial_out);

   init;
   repeat (2) @(negedge clk);
     reset = 0;

    for (i = 7; i >= 0; i = i - 1) begin
      serial_in = data[i];
        @(negedge clk);
     end

    serial_in = 0;
    repeat (4) @(negedge clk);

        $finish;
    end

endmodule