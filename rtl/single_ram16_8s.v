
module single_ram16_8s (
    input [7:0] din,
    output reg [7:0] dout,
    input clk, reset, we, re,
    input [3:0] addr
);

    parameter width = 8, depth = 16, address_bus = 4;

    reg [width-1:0] mem [depth-1:0];
    integer i;

    always @(posedge clk) begin
        if (reset) begin
            dout <= 0;
            for (i = 0; i < depth; i = i + 1)
                mem[i] <= 0;
        end
        else begin
            if (we == 1)
                mem[addr] <= din;

            if (re == 1)
                dout <= mem[addr];
        end
    end

endmodule
