module prior_tb;

reg [7:0] d;
wire [2:0] y;
wire valid;

prior dut(.d(d), .y(y), .valid(valid));

task init;
begin
    d = 8'b00000000;
end
endtask

task dr(input [7:0] td);
begin
    d = td;
    #10;
end
endtask

initial begin
    init;
    dr(8'b00000001);
    dr(8'b00000010);
    dr(8'b00000100);
    dr(8'b00001000);
    dr(8'b00010000);
    dr(8'b00100000);
    dr(8'b01000000);
    dr(8'b10000000);

    dr(8'b00101010);
    dr(8'b11000001);
    dr(8'b00000000);
end

initial begin
    $monitor("time=%0t d=%b y=%b valid=%b",
             $time, d, y, valid);
    #100 $finish;
end

endmodule