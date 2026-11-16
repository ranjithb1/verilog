module priority_circuit_8(input [7:0] i, output [7:0] h);

wire [7:1] not_i;

not u7(not_i[7], i[7]);
not u6(not_i[6], i[6]);
not u5(not_i[5], i[5]);
not u4(not_i[4], i[4]);
not u3(not_i[3], i[3]);
not u2(not_i[2], i[2]);
not u1(not_i[1], i[1]);

assign h[7] = i[7];

and g6(h[6], not_i[7], i[6]);
and g5(h[5], not_i[7], not_i[6], i[5]);
and g4(h[4], not_i[7], not_i[6], not_i[5], i[4]);
and g3(h[3], not_i[7], not_i[6], not_i[5], not_i[4], i[3]);
and g2(h[2], not_i[7], not_i[6], not_i[5], not_i[4], not_i[3], i[2]);
and g1(h[1], not_i[7], not_i[6], not_i[5], not_i[4], not_i[3], not_i[2], i[1]);
and g0(h[0], not_i[7], not_i[6], not_i[5], not_i[4], not_i[3], not_i[2], not_i[1], i[0]);

endmodule


module binary_encoder_8_3(input [7:0] h, output [2:0] y, output v);

or out2(y[2], h[7], h[6], h[5], h[4]);
or out1(y[1], h[7], h[6], h[3], h[2]);
or out0(y[0], h[7], h[5], h[3], h[1]);

or outv(v, h[7], h[6], h[5], h[4], h[3], h[2], h[1], h[0]);

endmodule


module priority_encoder8to3(input [7:0] i, output [2:0] y, output v);

wire [7:0] h_bus;

priority_circuit_8 pc_unit(i, h_bus);

binary_encoder_8_3 be_unit(h_bus, y, v);

endmodule