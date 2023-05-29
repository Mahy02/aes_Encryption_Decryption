/////////////////////////////////Provided PseudoCode for Integrated Decryption Process///////////////////////////////
//////InvCipher(byte in[4*Nb], byte out[4*Nb], word w[Nb*(Nr+1)])
//////begin
//////byte state[4,Nb]
//////state = in
//////AddRoundKey(state, w[Nr*Nb, (Nr+1)*Nb-1]) // See Sec. 5.1.4
//////for round = Nr-1 step -1 downto 1
//////InvShiftRows(state) // See Sec. 5.3.1
//////InvSubBytes(state) // See Sec. 5.3.2
//////AddRoundKey(state, w[round*Nb, (round+1)*Nb-1])
//////InvMixColumns(state) // See Sec. 5.3.3
//////end for
//////InvShiftRows(state)
//////InvSubBytes(state)
//////AddRoundKey(state, w[0, Nb-1])
//////out = state
//////end


module Decryption #(parameter Nb=128,parameter Nr=10,parameter Nk=4)
(
input [0:127] Input_Data,
input  [0: Nb-1] Key,
output  [0:127] Output_Data

);




///////////////////////Variables///////////////////////////////
wire [0:127] ExpandedKeys_Batch [0:Nr+1];   //a state for each round

wire [0: (128*(Nr+1))-1] KeysExpansionResults;  //an array of size (rounds) containing all expansion keys needed for all rounds

wire [0:127] InvSubTypes_loop[0:Nr-1];
                              //Inverse Subbytes (one for the loop of rounds and the other for the last function call)
//wire [0:127] InvSubTypes_Out;

wire [0:127] InvShiftRow_loop[0:Nr-1];
                              // Inverse Shift rows (one for the loop of rounds and the other for the last function call)
//wire [0:127] InvShiftRow_Out;

wire [0:127] Inverse_MixColumns_loop[0:Nr-1];
                              // Inverse Mix Columns (one for the loop of rounds and the other for the last function call)
//wire [0:127] MixColumns_Out;






//---------------------------------start of decryption-------------------
KeyExp #(Nk,Nr) key_expansion (Key, KeysExpansionResults);

AddRoundKey RoundKey_first (Input_Data,KeysExpansionResults[(128*Nr)+:128] ,ExpandedKeys_Batch[0]);


genvar i; // declare the generate variable
generate
//for round = Nr-1 step -1 downto 1
  for (i = 1; i < Nr; i = i + 1) begin:loop
  
       //shift rows
		  if(i==1)
		  Inverse_ShiftRow SHR_INV (ExpandedKeys_Batch[i-1],InvShiftRow_loop[i-1]);
		  else
		  Inverse_ShiftRow SHR_INV (Inverse_MixColumns_loop[i-2],InvShiftRow_loop[i-1]);
		  
        
        //subbytes
        SubBytes_DEC SB_INV (InvShiftRow_loop[i-1],InvSubTypes_loop[i-1]);
		  
		  //add round key
        AddRoundKey add_round_key_loopi (InvSubTypes_loop[i-1],KeysExpansionResults[(128*(Nr-i)) +: 128], ExpandedKeys_Batch[i]);

        //mix columns
        InverseMixColumns MC_INV (ExpandedKeys_Batch[i], Inverse_MixColumns_loop[i-1]);

       
  end
endgenerate


//Then the last round of Decryption
  
    Inverse_ShiftRow SHR_INV_last ( Inverse_MixColumns_loop[Nr-2],InvShiftRow_loop[Nr-1]);
	 SubBytes_DEC SB_INV_last (InvShiftRow_loop[Nr-1],InvSubTypes_loop[Nr-1]);  
    AddRoundKey add_round_key_last (InvSubTypes_loop[Nr-1],KeysExpansionResults[0:127], ExpandedKeys_Batch[Nr]);


    assign Output_Data=ExpandedKeys_Batch[Nr];


endmodule
