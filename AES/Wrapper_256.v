module Wrapper_256(
//input clk,
//input rst,
//input en,
input [0:127] inputdata,
input [0:255]inputkey,
input [0:127] expected_encrypted,
output led
);
////////////Variables////////////
//wire[0:127] inputdata=128'h32431238feca308d317908a2eb3ff224;
//wire[0:255] inputkey=256'h00fae203011106070802220b0c0d0e0f10ef521332451617181998ab1c1d567f;
wire[0:383] serialencinput={inputdata[0:127],inputkey[0:255]};
reg [0:127] outputenc;
reg [0:127] outputdec;
wire[0:383] serialdecinput={outputenc[0:127],inputkey[0:255]};
//wire[0:127] expected_encrypted = 128'h_38cc2b13b07fdb8288d91b109d2fe180;
//wire[0:127] expected_decrypted = 128'h00112233445566778899aabbccddeeff;
wire outputencbit;
wire outputdecbit;
integer deciterator=0;
integer enciterator=0;
wire encryptcs;
wire decryptcs;
integer i=0;
integer j=0;
wire [0:127] test;



Enc_wrapper #(256,14,8) slave1(.MISO(outputencbit),
.MOSI(serialencinput[enciterator-1]),
.reset(rst),
.clk(clk),
.CS(encryptcs)
);

Dec_wrapper  #(256,14,8) slave2(.MISO(outputdecbit),
.MOSI(serialdecinput[deciterator-1]),
.reset(rst),
.clk(clk),
.CS(decryptcs),
.test(test)
);


always @(negedge clk) 
begin
if(outputencbit==1'b1 | outputencbit==1'b0)
	begin


	outputenc[i]=outputencbit;
	i=i+1;

	end
if(outputdecbit==1'b1 | outputdecbit==1'b0)
		begin

		outputdec[j]=outputdecbit;
		j=j+1;

		end
end
always @ (posedge clk, posedge rst) 
begin
	if (rst) 
	   begin
			  deciterator <= 0;
			  enciterator <= 0;
		 end
else begin
		 if(en  & !encryptcs)
			 begin
				enciterator=enciterator+1;
			 end
		
	
		if(en  & !decryptcs)
			begin
				deciterator=deciterator+1;	
			end
end

end



assign encryptcs =((enciterator>383 & i>=128) | rst ) ? 1'b1: !en;
assign decryptcs =(rst | !en) ? 1'b1: !encryptcs;

	assign led=(outputdec == inputdata & outputenc==expected_encrypted & !rst ) ?1'b1 : 1'b0;


endmodule
