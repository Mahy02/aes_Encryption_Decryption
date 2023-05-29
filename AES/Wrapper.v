module Wrapper(
input clk,
input rst,
input en,
output led
);
////////////Variables////////////
wire[0:127] inputdata=128'h00112233445566778899aabbccddeeff;
wire[0:127] inputkey=128'h000102030405060708090a0b0c0d0e0f;
wire[0:255] serialencinput={inputdata[0:127],inputkey[0:127]};
reg [0:127] outputenc;
reg [0:127] outputdec;
wire[0:255] serialdecinput={outputenc[0:127],inputkey[0:127]};
wire[0:127] expected_encrypted = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
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


Enc_wrapper slave1(.MISO(outputencbit),
.MOSI(serialencinput[enciterator-1]),
.reset(rst),
.clk(clk),
.CS(encryptcs)
);

Dec_wrapper slave2(.MISO(outputdecbit),
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
//if(rst) begin
//		deciterator=0;
//		enciterator=0;
//	end
	
end
//if(enciterator>383 & !rst) begin
//
//	assign encryptcs=!en;
//
//	end

//(!(enciterator>383 & i>128))
assign encryptcs =((enciterator>383 & i>=128) | rst ) ? 1'b1: !en;
assign decryptcs =(rst | !en) ? 1'b1: !encryptcs;
//if(deciterator>383 & !rst) begin
//
//	assign decryptcs=!en;
//
//	end
	
//if(outputdec == inputdata & outputenc==expected_encrypted & !rst ) begin
	assign led=(outputdec == inputdata & outputenc==expected_encrypted & !rst ) ?1'b1 : 1'b0;
//	end
//else begin
//	assign led=1'b0;
//	end

endmodule
