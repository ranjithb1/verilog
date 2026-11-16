
`timescale 1ns / 1ps

module mux_4x1_tb;

reg I0, I1, I2, I3;
reg S0, S1;
wire Y;

mux_4x1 uut (.I0(I0),.I1(I1),.I2(I2),.I3(I3),.S0(S0),.S1(S1),.Y(Y));

initial begin

    for (i = 0; i < 64; i = i + 1) begin
        {I3,I2,I1,I0,S1,S0} = i;
        #10;
    end

    $finish;
end

initial begin
    $monitor("I0=%b I1=%b I2=%b I3=%b S1=%b S0=%b Y=%b",
             I0,I1,I2,I3,S1,S0,Y);

end

endmodule
