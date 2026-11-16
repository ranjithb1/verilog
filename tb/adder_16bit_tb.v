
module tb_adder;

reg [15:0] a,b;
wire [16:0] sum;

reg [16:0] exp;
integer i;

// module instantiation
adder a1(a,b,sum);

// self checking task
task check;
input [15:0] x,y;
begin
    a = x;
    b = y;
    exp = x + y;
    #10;

    if(sum !== exp)
    begin
        $display("ERROR: a=%h b=%h sum=%h expected=%h",
                  a,b,sum,exp);
        $stop;
    end
    else
    begin
        $display("PASS: a=%h b=%h sum=%h",
                  a,b,sum);
    end
end
endtask

// applying stimulus
initial
begin
    // initialize inputs
    a = 0;
    b = 0;

    // directed test cases
    check(16'h0000,16'h0000);
    check(16'h0001,16'h0001);
    check(16'h0005,16'h000A);
    check(16'h00FF,16'h0001);
    check(16'h0FFF,16'h0001);
    check(16'hFFFF,16'h0001);
    check(16'hFFFF,16'hFFFF);
    check(16'h8000,16'h8000);
    check(16'hAAAA,16'h5555);

    // random test cases
    for(i=0;i<100;i=i+1)
    begin
        check($random,$random);
    end

    $display("--------------------------------");
    $display("ALL TEST CASES COMPLETED");
    $display("--------------------------------");

    $finish;
end

endmodule