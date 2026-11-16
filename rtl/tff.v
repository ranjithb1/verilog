module dff(input clk,rst,din, output reg q, output qb);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
		
		
    else
        q <= din;
end

assign qb = ~q;

endmodule


module tff(input clk,rst,t, output q, output qb);

wire d;

assign d = t^ q;

dff d1(.clk(clk), .rst(rst), .din(d), .q(q), .qb(qb));

endmodule


