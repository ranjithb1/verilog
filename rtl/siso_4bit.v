

module siso_4bit(input clk, reset, serial_in, output serial_out);

 reg [3:0] q;

 always @(posedge clk) begin
    if (reset)
       q <= 4'b0000;
   else
     q <= {q[2:0], serial_in};
  end

    assign serial_out = q[3];

endmodule
