
module dual_ram8_16a (
    input [15:0] din,
    output reg [15:0] dout,
    input clk, reset, w_e, r_e,
    input [2:0] w_a, r_a
);

    parameter width = 16, depth = 8, address_bus = 3;

    reg [width-1:0] memory [depth-1:0];
    integer i;

    // Synchronous write
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < depth; i = i + 1)
                memory[i] <= 0;
        end
        else if (w_e) begin
            memory[w_a] <= din;
        end
    end

    // Asynchronous read
    always @(*) begin
        if (reset)
            dout = 0;
        else if (r_e)
            dout = memory[r_a];
        else
            dout = 0;
    end

endmodule
