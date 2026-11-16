
`timescale 1ns/1ps

module fifo (
    input clk,
    input reset,
    input [7:0] data_in,
    input read_n,
    input write_n,
    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] mem [0:15];

reg [3:0] wr_ptr;
reg [3:0] rd_ptr;
reg [4:0] count;

assign full  = (count == 16);
assign empty = (count == 0);

always @(posedge clk or negedge reset)
begin
    if (!reset)
    begin
        wr_ptr   <= 0;
        rd_ptr   <= 0;
        count    <= 0;
        data_out <= 0;
    end

    else
    begin
        case ({!write_n, !read_n})

            // WRITE ONLY
            2'b10:
            begin
                if (!full)
                begin
                    mem[wr_ptr] <= data_in;
                    wr_ptr <= wr_ptr + 1'b1;
                    count <= count + 1'b1;
                end
            end

            // READ ONLY
            2'b01:
            begin
                if (!empty)
                begin
                    data_out <= mem[rd_ptr];
                    rd_ptr <= rd_ptr + 1'b1;
                    count <= count - 1'b1;
                end
            end

            // SIMULTANEOUS READ AND WRITE
            2'b11:
            begin
                if (!empty && !full)
                begin
                    mem[wr_ptr] <= data_in;
                    data_out <= mem[rd_ptr];

                    wr_ptr <= wr_ptr + 1'b1;
                    rd_ptr <= rd_ptr + 1'b1;

                    count <= count;
                end
                else if (empty)
                begin
                    // Allow write when FIFO is empty
                    mem[wr_ptr] <= data_in;
                    wr_ptr <= wr_ptr + 1'b1;
                    count <= count + 1'b1;
                end
                else if (full)
                begin
                    // Allow read when FIFO is full
                    data_out <= mem[rd_ptr];
                    rd_ptr <= rd_ptr + 1'b1;
                    count <= count - 1'b1;
                end
            end

            default:
            begin
                count <= count;
            end

        endcase
    end
end

endmodule
