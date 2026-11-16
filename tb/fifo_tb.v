
`timescale 1ns/1ps

module fifo_tb;

reg clk, rst;
reg [7:0] din;
reg rd, wr;

wire [7:0] dout;
wire full, empty;

integer i;

// DUT
fifo uut (
    .clk(clk),
    .reset(rst),
    .data_in(din),
    .read_n(rd),
    .write_n(wr),
    .data_out(dout),
    .full(full),
    .empty(empty)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// WRITE TASK
task write;
input [7:0] d;
begin
    @(negedge clk);
    din = d;
    wr = 0;

    @(negedge clk);
    wr = 1;

    $display("WRITE: din=%h full=%b empty=%b",
              d, full, empty);
end
endtask

// READ TASK
task read;
begin
    @(negedge clk);
    rd = 0;

    @(posedge clk);
    #1;

    $display("READ: dout=%h full=%b empty=%b",
              dout, full, empty);

    @(negedge clk);
    rd = 1;
end
endtask

// SIMULTANEOUS READ AND WRITE TASK
task rw;
input [7:0] d;
begin
    @(negedge clk);
    din = d;
    wr = 0;
    rd = 0;

    @(posedge clk);
    #1;

    $display("RW: din=%h dout=%h full=%b empty=%b",
              d, dout, full, empty);

    @(negedge clk);
    wr = 1;
    rd = 1;
end
endtask

// MAIN TEST
initial begin

    rst = 0;
    din = 0;
    rd = 1;
    wr = 1;

    #12 rst = 1;

    $display("\nRESET: full=%b empty=%b", full, empty);

    // 16 WRITE OPERATIONS
    $display("\n--- WRITE 16 DATA ---");

    for(i = 0; i < 16; i = i + 1)
        write(i + 8'h10);

    #1;
    $display("AFTER 16 WRITES: full=%b empty=%b",
              full, empty);

    // READ TWO DATA
    $display("\n--- READ TWO DATA ---");

    read();
    read();

    // SIMULTANEOUS READ AND WRITE
    $display("\n--- SIMULTANEOUS READ AND WRITE ---");

    rw(8'hAA);

    // READ REMAINING DATA
    $display("\n--- READ REMAINING DATA ---");

    for(i = 0; i < 14; i = i + 1)
        read();

    #1;

    $display("\nFINAL STATUS: full=%b empty=%b",
              full, empty);

    $display("\n--- TEST COMPLETED ---");

    $finish;
end

endmodule

`timescale 1ns/1ps

module fifo_tb;

reg clk, rst;
reg [7:0] din;
reg rd, wr;

wire [7:0] dout;
wire full, empty;

integer i;

// DUT
fifo uut (
    .clk(clk),
    .reset(rst),
    .data_in(din),
    .read_n(rd),
    .write_n(wr),
    .data_out(dout),
    .full(full),
    .empty(empty)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// WRITE TASK
task write;
input [7:0] d;
begin
    @(negedge clk);
    din = d;
    wr = 0;

    @(negedge clk);
    wr = 1;

    $display("WRITE: din=%h full=%b empty=%b",
              d, full, empty);
end
endtask

// READ TASK
task read;
begin
    @(negedge clk);
    rd = 0;

    @(posedge clk);
    #1;

    $display("READ: dout=%h full=%b empty=%b",
              dout, full, empty);

    @(negedge clk);
    rd = 1;
end
endtask

// SIMULTANEOUS READ AND WRITE TASK
task rw;
input [7:0] d;
begin
    @(negedge clk);
    din = d;
    wr = 0;
    rd = 0;

    @(posedge clk);
    #1;

    $display("RW: din=%h dout=%h full=%b empty=%b",
              d, dout, full, empty);

    @(negedge clk);
    wr = 1;
    rd = 1;
end
endtask

// MAIN TEST
initial begin

    rst = 0;
    din = 0;
    rd = 1;
    wr = 1;

    #12 rst = 1;

    $display("\nRESET: full=%b empty=%b", full, empty);

    // 16 WRITE OPERATIONS
    $display("\n--- WRITE 16 DATA ---");

    for(i = 0; i < 16; i = i + 1)
        write(i + 8'h10);

    #1;
    $display("AFTER 16 WRITES: full=%b empty=%b",
              full, empty);

    // READ TWO DATA
    $display("\n--- READ TWO DATA ---");

    read();
    read();

    // SIMULTANEOUS READ AND WRITE
    $display("\n--- SIMULTANEOUS READ AND WRITE ---");

    rw(8'hAA);

    // READ REMAINING DATA
    $display("\n--- READ REMAINING DATA ---");

    for(i = 0; i < 14; i = i + 1)
        read();

    #1;

    $display("\nFINAL STATUS: full=%b empty=%b",
              full, empty);

    $display("\n--- TEST COMPLETED ---");

    $finish;
end

endmodule
