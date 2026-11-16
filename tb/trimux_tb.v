module mux4x1_using2x1mux_tristate_tb;

reg d0,d1,d2,d3,s1,s0,en;
wire y;
integer i,j;

trimux uut(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.s1(s1),.s0(s0),.en(en),.y(y));

initial begin
    en = 1;

    for(i=0;i<16;i=i+1) begin
        {d3,d2,d1,d0} = i;

        for(j=0;j<4;j=j+1) begin
            {s1,s0} = j;
            #10;
        end
    end

    en = 0;
    #10;

    $finish;
end

initial begin
    $monitor("en=%b | s1=%b s0=%b | d0=%b d1=%b d2=%b d3=%b | y=%b",en,s1,s0,d0,d1,d2,d3,y);
end

endmodule