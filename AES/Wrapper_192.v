module Wrapper_192(
input clk,
input rst,
input en,
output led
);
////////////Variables////////////
wire[0:127] inputdata=128'h_00112233_44556677_8899aabb_ccddeeff;
wire[0:191] inputkey=192'h_00010203_04050607_08090a0b_0c0d0e0f_10111213_14151617;
wire[0:319] serialencinput={inputdata[0:127],inputkey[0:191]};
reg [0:127] outputenc;
reg [0:127] outputdec;
wire[0:319] serialdecinput={outputenc[0:127],inputkey[0:191]};
wire[0:127] expected_encrypted = 128'h_dda97ca4864cdfe06eaf70a0ec0d7191;
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


Enc_wrapper #(192,12,6)slave1(.MISO(outputencbit),
.MOSI(serialencinput[enciterator-1]),
.reset(rst),
.clk(clk),
.CS(encryptcs)
);

Dec_wrapper #(192,12,6)slave2(.MISO(outputdecbit),
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