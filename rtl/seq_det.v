
module seq_det (input clk,reset,din, output dout);

parameter S0=2'b00, S1= 2'b01, S2= 2'b10, S3=  2'b11;

reg [1:0]ps ;
reg [1:0]ns ;

always @(posedge clk)
   begin 
      if (reset)
	    ps<=S0;
		else
		ps<=ns;
	end

always @(*) 
  begin 
  
  case(ps)
  S0: begin
   if (din==1'b1)
    ns=S1;
	else 
	ns=S0;
  end
  
  S1:begin 
     if(din==1'b0)
	 ns=S2;
	 else
	 ns=S1;
  end
  
  S2:begin 
   if (din==1'b1)
   ns=S3;
   else 
   ns=S0;
  end
  
  S3:begin
   if (din==1'b1)
   ns=S1;
   else
   ns=S2;
  end
   default :ns=S0;
   
   endcase
   end
   
	assign dout=(ps==S3);
endmodule