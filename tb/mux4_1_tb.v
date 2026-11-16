`timescale 1ns/1ps

module mux4_1_tb;

reg [3:0] d;
reg [1:0] sel;
wire y;

integer i, j;
integer errors;

reg expected;

mux4 dut (
    .d(d),
    .sel(sel),
    .y(y)
);

initial begin

    errors = 0;

    $display("Starting MUX4 Test");

    for (i = 0; i < 16; i = i + 1) begin

        for (j = 0; j < 4; j = j + 1) begin

            d = i;
            sel = j;

            #10;

	expected = d[sel];

	if (y !== expected) begin
$display("FAIL: d=%b sel=%b y=%b expected=%b",
	  d, sel, y, expected);
	errors = errors + 1;
end
else begin
	$display("PASS: d=%b sel=%b y=%b",
                          d, sel, y);
	end

        end
    end

    if (errors == 0)
        $display("ALL TEST CASES PASSED!");
    else
        $display("TEST FAILED: %0d errors", errors);

    $finish;

end

endmodule