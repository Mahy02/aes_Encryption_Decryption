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


module Encyrption #(parameter Nb=128,parameter Nr=10,parameter Nk=4)(
input [0:127] datain,
input [0: Nb-1] key,
output [0:127] dataout
);
wire [0:127] states [0:Nr+1];   //to save each state after each round
wire [0: (128*(Nr+1))-1] expandedKeys;  //expanded keys for all the rounds
wire [0:127] subbytes_Result_loop[0:Nr-1];
wire [0:127] shiftrows_Result_loop[0:Nr-1];
wire [0:127] mixcolumns_Result_loop[0:Nr-1];
//wire [0:127] subbytes_Result;
//wire [0:127] shiftrows_Result;
//wire [0:127] mixcolumns_Result;


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





