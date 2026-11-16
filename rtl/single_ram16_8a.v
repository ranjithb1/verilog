
module single_ram16_8a (
    input [7:0] din,
    output reg [7:0] dout,
    input clk, reset, w_e, r_e,
    input [3:0] addr
);

    parameter width = 8, depth = 16;

    reg [width-1:0] memory [depth-1:0];
    integer i;

    // Synchronous write
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < depth; i = i + 1)
                memory[i] <= 0;
        end
        else if (w_e) begin
            memory[addr] <= din;
        end
    end

    // Asynchronous read
    always @(*) begin
        if (reset)
            dout = 0;
        else if (r_e)
            dout = memory[addr];
        else
            dout = 0;
    end

endmodule
