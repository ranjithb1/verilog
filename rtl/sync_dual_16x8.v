

module sync_dual_16x8 (
    input [7:0] din,
    output reg [7:0] dout,
    input clk, reset, we, re,
    input [3:0] wa, ra
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
            if (we)
                mem[wa] <= din;

            if (re)
                dout <= mem[ra];
        end
    end

endmodule
