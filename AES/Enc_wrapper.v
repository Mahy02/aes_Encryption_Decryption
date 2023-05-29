/*
psuedo code for encyrption::
Cipher(byte in[4*Nb], byte out[4*Nb], word w[Nb*(Nr+1)])
 
begin
 
byte state[4,Nb]
 
state = in
 
AddRoundKey(state, w[0, Nb-1]) // See Sec. 5.1.4
 
for round = 1 step 1 to Nr–1
 
SubBytes(state) // See Sec. 5.1.1
 
ShiftRows(state) // See Sec. 5.1.2
 
MixColumns(state) // See Sec. 5.1.3
 
AddRoundKey(state, w[round*Nb, (round+1)*Nb-1])
 
end for
 
SubBytes(state)
 
ShiftRows(state)
 
AddRoundKey(state, w[Nr*Nb, (Nr+1)*Nb-1])
 
out = state
 
end

*/


//-------------------------------------With wrapper--------------------------------

/*
==> datain, dataout::
---------------------

*/

module Enc_wrapper #(parameter Nb=128,parameter Nr=10,parameter Nk=4)(
input MOSI,
output  MISO,
input CS,
input clk,
input reset

);

integer iterator_data=0;
integer iterator_key=0;
integer iterator_out=0;

reg [0:127] datain ;
reg  [0: Nb-1] key;
wire  [0:127]dataout;

wire [0:127] states [0:Nr+1];   //to save each state after each round
wire [0: (128*(Nr+1))-1] expandedKeys;  //expanded keys for all the rounds
wire [0:127] subbytes_Result_loop[0:Nr-1];
wire [0:127] shiftrows_Result_loop[0:Nr-1];
wire [0:127] mixcolumns_Result_loop[0:Nr-1];


always @(negedge clk)
begin
	if(CS== 1'b0)
	begin
		if(iterator_data<128)
			begin
			datain[iterator_data]=MOSI;
			
			iterator_data=iterator_data+1;
			end
		else
			begin
			key[iterator_data-128]=MOSI;
			iterator_data=iterator_data+1;
			end
	end
end
//assign test[0:127]=datain[0:127];

always @(posedge clk)
begin
	

		if(iterator_data>600)
		begin
		iterator_out=iterator_out+1;
		end

end

assign  MISO=(iterator_data>=600) ? dataout[iterator_out]: 1'bZ;



//start of our encryption:

KeyExp #(Nk,Nr) key_expansion (key, expandedKeys);

AddRoundKey add_round_key_0 (datain, expandedKeys[0:127],states[0]);

//we took from 0 till 127 in the expanded keys 

//looping accoridng to no of rounds:
genvar i; // declare the generate variable
generate
  for (i = 1; i <  Nr; i = i + 1) begin:loop
        //subbytes
        SubBytes SBS (states[i-1],subbytes_Result_loop[i-1]);
        //shift rows
        ShiftRow SHRS (subbytes_Result_loop[i-1],shiftrows_Result_loop[i-1]);
        //mix columns
        MixColumns MCS (shiftrows_Result_loop[i-1], mixcolumns_Result_loop[i-1]);
        //add round key
        AddRoundKey add_round_key_i (mixcolumns_Result_loop[i-1], expandedKeys[(128*i)+:128],states[i]);
  end
endgenerate

    //after loop:
    SubBytes SB (states[Nr-1],subbytes_Result_loop[Nr-1]);  
    //shift rows
    ShiftRow SHR (subbytes_Result_loop[Nr-1],shiftrows_Result_loop[Nr-1]);
    //add last round key
    AddRoundKey add_round_key (shiftrows_Result_loop[Nr-1],expandedKeys[(128*Nr)+:128], states[Nr]);


    //output
    assign dataout=states[Nr];


endmodule