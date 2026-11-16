module alu_tb();

   reg [7:0] a,b;
   reg [3:0] command;
   reg enable;
   wire [15:0] out;

   integer m,n,o;

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

   reg [4*8:0] string_cmd;

   alu dut(a,b,command,enable,out);

   task initialize;
      begin
         a = 0;
         b = 0;
         command = 0;
         enable = 0;
      end
   endtask

   task en_oe(input i);
      begin
         enable = i;
      end
   endtask

   task inputs(input [7:0] j,k);
      begin
         a = j;
         b = k;
      end
   endtask

   task cmd(input [3:0] l);
      begin
         command = l;
      end
   endtask

   task delay;
      begin
         #10;
      end
   endtask

   always @(command)
   begin
      case(command)
         add   : string_cmd = "add";
         inc   : string_cmd = "inc";
         sub   : string_cmd = "sub";
         dec   : string_cmd = "dec";
         mul   : string_cmd = "mul";
         div   : string_cmd = "div";
         shl   : string_cmd = "shl";
         shr   : string_cmd = "shr";
         and_  : string_cmd = "and";
         or_   : string_cmd = "or";
         inv   : string_cmd = "inv";
         nand_ : string_cmd = "nand";
         nor_  : string_cmd = "nor";
         xor_  : string_cmd = "xor";
         xnor_ : string_cmd = "xnor";
         buf_  : string_cmd = "buf";
         default: string_cmd = "unknown";
      endcase
   end

   initial
   begin
      initialize;
      en_oe(1'b1);

      for (m=0;m<16;m=m+1)
      begin
         for (n=0;n<16;n=n+1)
         begin
            inputs(m,n);

            for (o=0;o<16;o=o+1)
            begin
               command = o;
               delay;
            end
         end
      end

      en_oe(0);
      inputs(8'd20,8'd10);
      cmd(add);
      delay;

      en_oe(1);
      inputs(8'd25,8'd17);
      cmd(add);
      delay;

      $finish;
   end

   initial
   begin
      $monitor("input oe=%b, a=%b, b=%b, command=%s, output out=%b",
               enable,a,b,string_cmd,out);
   end

endmodule