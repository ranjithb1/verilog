
module decoder_3to8_tb;

reg [2:0] a;
wire [7:0] y;

decoder_3to8 dut(.a(a), .y(y));

task init;
begin
    a = 3'b000;
end
endtask

task dr;
  input [2:0] ta;
   begin
    a = ta;
   #10;
    end
endtask

initial 
    begin
    init;
    dr(3'b000);
    dr(3'b001);
    dr(3'b010);
    dr(3'b011);
    dr(3'b100);
    dr(3'b101);
    dr(3'b110);
    dr(3'b111);

    $finish;
end

initial begin
    $monitor("time=%0t a=%b y=%b", $time, a, y);
end

endmodule
