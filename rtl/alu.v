module alu(
    input [7:0] a,b,
    input [3:0] cmd,
    input oe,
    output [15:0] out );
   parameter add   = 4'b0000,
             inc   = 4'b0001,
             sub   = 4'b0010,
             dec   = 4'b0011,
             mul   = 4'b0100,
             div   = 4'b0101,
             shl   = 4'b0110,
             shr   = 4'b0111,
             and_  = 4'b1000,
             or_   = 4'b1001,
             inv   = 4'b1010,
             nand_ = 4'b1011,
             nor_  = 4'b1100,
             xor_  = 4'b1101,
             xnor_ = 4'b1110,
             buf_  = 4'b1111;
   reg [15:0] result;

   always @(*)
   begin
      case(cmd)
         add   : result = a + b;
         inc   : result = a + 1;
         sub   : result = a - b;
         dec   : result = a - 1;
         mul   : result = a * b;
         div   : result = (b != 0) ? a / b : 16'b0;
         shl   : result = a << 1;
         shr   : result = a >> 1;
         and_  : result = a & b;
         or_   : result = a | b;
         inv   : result = {8'b0,~a};
         nand_ : result = {8'b0,~(a & b)};
         nor_  : result = {8'b0,~(a | b)};
         xor_  : result = a ^ b;
         xnor_ : result = a ~^ b;
         buf_  : result = a;
         default: result = 16'b0;
      endcase
   end
   assign out = oe ? result : 16'hzzzz;
endmodule