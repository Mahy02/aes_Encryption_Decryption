// This is the module for Mix Columns 
//What it does:
/*
This is the third step in the encryption process, it takes as input (127 bit) and returns (127 bit) output
those 127 bits are displayed as matrix 4x4 where each cell is a byte (8 bits) 
The MixColumns Matrix is =>
                          0   1   2  3
                    0   |  2  3  1  1  |
                    1   |  1  2  3  1  |
                    2   |  1  1  2  3  |
                    3   |  3  1  1  2  |
We use matrix multiplication to multiply the Mix Columns Matrix with the input matrix
The input matrix is displayed as 4x4 like this:
                              0       1       2       3
                    0    |  0:7    39:32   71:64  103:96   |
                    1    |  15:8   47:40   79:72  111:104  |
                    2    |  23:16  55:48   87:80  119:112  |
                    3    |  31:24  63:56   95:88  127:120  |
We multiply each row in MixColumn Matrix with each column in the Input Matrix to get output 4x4 matrix
===> Example:     02*[0:7] + 03 * [15:8] + 01 * [23:16] + 01 * [31:24]

Note that:
        (03) is divided into 02* [15:8] + 01 * [15:8]    so mul_2(input) xor (input)
        (02) is Shift Left , However if the MSB is (0)=> we remove the 0 and add 0 to the LSB "normal shift"
                                    else if MSB is (1)=> we remove the 1 add 0 to the LSB then XOR with (1B) which is 0001 1011 in binary
        We convert every thing in Input matrix to binary
        Any addition is at the end an XOR
*/

module MixColumns(in,out);
input [0:127]in;
output [0:127]out;

//Column 0:
//---------
//cell 0,0   =>   02*[0:7] + [[[02* [15:8] + 01 * [15:8]]]]] + 01 * [23:16] + 01 * [31:24]    (2311)
//cell 1,0   =>   01*[0:7] + 02* [15:8]  + [[[02 * [23:16] +01*[23:16]]]] + 01 * [31:24]  (1231)
//cell 2,0   =>   01*[0:7] + 01*[15:8]  + 02 * [23:16]  + [[[02 * [31:24] + 01*[31:24] ]]] (1123)
//cell 3,0   =>   [[[02*[0:7] + 01*[0:7]]]] + 01*[15:8]  + 01 * [23:16]  + 02*[31:24]  (3112)

assign out[0:7] =  mul_2(in[0:7]) ^ mul_3(in[8:15]) ^ in[16:23] ^ in[24:31];
assign out[8:15] = in[0:7] ^ mul_2(in[8:15])  ^ mul_3(in[16:23]) ^ in[24:31];
assign out[16:23] = in[0:7] ^ in[8:15] ^ mul_2(in[16:23]) ^ mul_3(in[24:31]);
assign out[24:31] = mul_3(in[0:7])  ^ in[8:15] ^ in[16:23] ^ mul_2(in[24:31]); 




//Column 1:
//---------
//cell 0,1   =>   02*[32:39] + 02* [40:47] + 01 * [40:47] + 01 * [48:55] + 01 * [56:63]    (2311)
//cell 1,1   =>   01*[32:39] + 02* [40:47]  + 02 * [48:55] + 01*[48:55] + 01 * [56:63]   (1231)
//cell 2,1   =>   01*[32:39] + 01*[40:47]  + 02 * [48:55]  + 02 * [56:63]  + 01*[56:63]   (1123)
//cell 3,1   =>   02*[32:39] + 01*[32:39] + 01*[40:47]  + 01 * [48:55]  + 02*[31:24]  (3112)

assign out[32:39] =  mul_2(in[32:39]) ^ mul_3(in[40:47]) ^ in[48:55] ^ in[56:63];
assign out[40:47] = in[32:39] ^ mul_2(in[40:47]) ^ mul_3(in[48:55]) ^ in[56:63];
assign out[48:55] = in[32:39] ^ in[40:47] ^ mul_2(in[48:55]) ^ mul_3(in[56:63]); 
assign out[56:63] = mul_3(in[32:39]) ^ in[40:47] ^ in[48:55] ^ mul_2(in[56:63]); 



//Column 2:
//---------
//cell 0,2   =>   02*[64:71] + 02* [72:79] + 01 * [72:79] + 01 * [80:87] + 01 * [88:95]   (2311)
//cell 1,2   =>   01*[64:71] + 02* [72:79]  + 02 * [80:87]  + 01*[80:87]  + 01 * [88:95]   (1231)
//cell 2,2   =>   01*[64:71] + 01*[72:79]  + 02 * [80:87]   + 02 * [88:95] + 01*[88:95]   (1123)
//cell 3,2   =>   02*[64:71] + 01*[64:71] + 01*[72:79]  + 01 * [80:87]  + 02*[31:24]  (3112)

assign out[64:71] =  mul_2(in[64:71]) ^ mul_3(in[72:79])  ^ in[80:87] ^ in[88:95];
assign out[72:79] = in[64:71] ^ mul_2(in[72:79]) ^ mul_3(in[80:87]) ^ in[88:95];
assign out[80:87] = in[64:71] ^ in[72:79] ^ mul_2(in[80:87]) ^ mul_3(in[88:95]) ;
assign out[88:95] = mul_3(in[64:71]) ^ in[72:79] ^ in[80:87]  ^ mul_2(in[88:95]); 



//Column 3:
//---------
//cell 0,3   =>   02*[96:103] + 02* [104:111] + 01 * [104:111] + 01 * [112:119] + 01 * [120:127]   (2311)
//cell 1,3   =>   01*[96:103] + 02* [104:111]  + 02 * [112:119]  + 01*[112:119]  + 01 * [120:127]   (1231)
//cell 2,3   =>   01*[96:103] + 01*[104:111]  + 02 * [112:119]  + 02 * [120:127] + 01*[120:127]  (1123)
//cell 3,3   =>   02*[96:103] + 01*[96:103] + 01*[104:111]  + 01 * [112:119]  + 02*[120:127]  (3112)

assign out[96:103] =  mul_2(in[96:103]) ^ mul_3(in[104:111]) ^ in[112:119]  ^ in[120:127];
assign out[104:111] = in[96:103] ^ mul_2(in[104:111])  ^ mul_3(in[112:119])  ^ in[120:127];
assign out[112:119] = in[96:103] ^ in[104:111] ^ mul_2(in[112:119]) ^ mul_3(in[120:127]) ;
assign out[120:127] = mul_3(in[96:103]) ^ in[104:111] ^ in[112:119] ^ mul_2(in[120:127]); 





//function mul_2 just takes the byte in each cell (8 bits), see if the MSB is 0 or 1 and act accordingly
function [0:7]mul_2(input [0:7] cell_value);
begin
    if(cell_value[0] ==0)
    //we just shift left and return the output of mul_2 function
    mul_2 = {cell_value[1:7],1'b0};
    else
    //we shift left then XOR with 1b and return the output of mul_2 function
    mul_2 = {cell_value[1:7],1'b0}^8'h1b;
end
endfunction

//  mul3 function that uses the mul2 function
function [7:0] mul_3(input [7:0] x);
begin
    mul_3 = mul_2(x) ^ x;
end
endfunction

endmodule 





