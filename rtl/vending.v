module vending(input clk,rst,a,b,output reg x,y);

parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
reg [2:0] ps,ns;

always @(posedge clk or posedge rst)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end

always @(*)
begin
ns=ps;

case(ps)
s0:case({a,b})
2'b01:ns=s1;
2'b10:ns=s2;
default:ns=s0;
endcase

s1:case({a,b})
2'b01:ns=s2;
2'b10:ns=s3;
default:ns=s1;
endcase

s2:case({a,b})
2'b01:ns=s3;
2'b10:ns=s4;
default:ns=s2;
endcase

s3,s4:ns=s0;
default:ns=s0;
endcase
end

always @(*)
begin
x=0;
y=0;
case(ps)
s3: begin x=1;y=0; end
s4: begin x=1;y=1; end
endcase

end
endmodule