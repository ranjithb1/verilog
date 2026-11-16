
module sr_tb;
reg s, r;
wire q, qb;

sr dut(.s(s), .r(r), .q(q), .qb(qb));

initial
		begin
$monitor("T=%0t S=%b R=%b Q=%b QB=%b",$time, s, r, q, qb);

	s = 0; r = 1;
	#10 s = 0; r = 0;
	#10 s = 1; r = 0;
	#10 s = 0; r = 0;
	#10 s = 0; r = 1;
	#10 s = 0; r = 0;
	#10 s = 1; r = 1;
	#10 $finish;

end
endmodule