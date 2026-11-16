
module up_down_counter(
    input clk, reset, load, mode,
    input [3:0] din,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset)
        count <= 4'b0000;

    else if (load)
        count <= din;

    else begin
        case (mode)
 1'b1: begin
    if (count < 4'b1010)
   count <= count + 1'b1;
    else
      count <= 4'b0011;
   end

  1'b0: begin
    if (count > 4'b0110)
  count <= count - 1'b1;
   else
     count <= 4'b1100;
    end
  default: count <= count;
      endcase
    end
end

endmodule