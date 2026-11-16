module decoder_2to4(input a,b,en, output [3:0] y);

assign y[0] = en & ~a & ~b;
assign y[1] = en & ~a & b;
assign y[2] = en & a & ~b;
assign y[3] = en & a & b;

endmodule


module trimux(input d0,d1,d2,d3,s1,s0,en, output y);

wire [3:0] sel;

decoder_2to4 dec(.a(s1),.b(s0),.en(en),.y(sel));

bufif1 buf0(y,d0,sel[0]);
bufif1 buf1(y,d1,sel[1]);
bufif1 buf2(y,d2,sel[2]);
bufif1 buf3(y,d3,sel[3]);

endmodule