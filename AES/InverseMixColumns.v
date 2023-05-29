// This is the module for Inverse Mix Columns
// What it does:
/*
This is the fourth step in the decryption process, it takes as input (127 bit) and returns (127 bit) output
those 127 bits are displayed as matrix 4x4 where each cell is a byte (8 bits)
The Inverse MixColumns Matrix is =>
                                        0  1  2  3
                                    0 | 0E 0B 0D 09 |
                                    1 | 09 0E 0B 0D |
                                    2 | 0D 09 0E 0B |
                                    3 | 0B 0D 09 0E |
We use matrix multiplication to multiply the Inverse Mix Columns Matrix with the input matrix
The input matrix is displayed as 4x4 like this:
                                                 0     1   2       3
                                            0 | 0:7   39:32  71:64  103:96   |
                                            1 | 15:8  47:40  79:72  111:104  |
                                            2 | 23:16 55:48  87:80  119:112  |
                                            3 | 31:24 63:56  95:88  127:120  |
We multiply each row in Inverse MixColumns Matrix with each column in the Input Matrix to get output 4x4 matrix
===> Example: 0E*[0:7] + 0B * [15:8] + 0D * [23:16] + 09 * [31:24]

Note that:
We use a different MixColumns Matrix for decryption (the Inverse MixColumns Matrix)
We still use matrix multiplication to get the output
Each element in the Inverse MixColumns Matrix is obtained by applying a specific operation on the corresponding element in the MixColumns Matrix
We convert every thing in Input matrix to binary
Any addition is at the end an XOR

x×9=(((x×2)×2)×2)+x
==> *2*2*2 =8  +1 = 9

x×11=(  (   (   (x×2)×2   ) +x   )  ×2   )+x
==> *2*2 =4 +1 = 5 *2 = 10 +1 = 11

x×13=  (  (  (  (x×2)+x  )×2  ) ×2  )  +x
===> *3*2 = 6 *2 = 12 +1 =13          3-> *2 +1
===> ((*2+1) *2) *2) +1 

x×14=(     (   ((x×2)+x)  ×2   )+x   )   ×2 )
===> *3*2 =6 +1 = 7 * 12 = 14     3-> *2+1
===> *2+1 *2 +1 *2

(09)  ==> mul_2(mul_2(mul_2(input))) xor input  
(0B)  ==> mul_2(  mul_2(mul_2(input) XOR input)   ) XOR input     
(0D)  ===> mul_2(mul_2( mul_2(input) XOR input)     ) XOR input
(0E)  ===> mul_2( mul_2(mul_2(input) XOR input) XOR input)


*/

module InverseMixColumns(in,out);
input [0:127]in;
output [0:127]out;


//Column 0:
//---------
//cell 0,0   =>   0E*[0:7] + 0B* [15:8]  + 0D * [23:16] + 09 * [31:24] (0E 0B 0D 09)
//cell 1,0   =>   09*[0:7] + 0E* [15:8]  + 0B*[23:16] + 0D * [31:24]   (09 0E 0B 0D)
//cell 2,0   =>   0D*[0:7] + 09*[15:8]  + 0E * [23:16]  + 0B*[31:24]   (0D 09 0E 0B)
//cell 3,0   =>   0B*[0:7] + 0D*[15:8]  + 09 * [23:16]  + 0E*[31:24]   (0B 0D 09 0E)

assign out[0:7] =  mul_0E(in[0:7]) ^ mul_0B(in[8:15]) ^ mul_0D(in[16:23]) ^ mul_09(in[24:31]);
assign out[8:15] = mul_09(in[0:7]) ^ mul_0E(in[8:15]) ^ mul_0B(in[16:23]) ^ mul_0D(in[24:31]);
assign out[16:23]= mul_0D(in[0:7]) ^ mul_09(in[8:15]) ^ mul_0E(in[16:23]) ^ mul_0B(in[24:31]);
assign out[24:31]= mul_0B(in[0:7]) ^ mul_0D(in[8:15]) ^ mul_09(in[16:23]) ^ mul_0E(in[24:31]); 



//Column 1:
//---------
//         [32:39]  [40:47]  [48:55]  [56:63]
//cell 0,1   =>    (0E 0B 0D 09)
//cell 1,1   =>    (09 0E 0B 0D)
//cell 2,1   =>    (0D 09 0E 0B)
//cell 3,1   =>    (0B 0D 09 0E)

assign out[32:39] = mul_0E(in[32:39]) ^ mul_0B(in[40:47]) ^ mul_0D(in[48:55]) ^ mul_09(in[56:63]);
assign out[40:47] = mul_09(in[32:39]) ^ mul_0E(in[40:47]) ^ mul_0B(in[48:55]) ^ mul_0D(in[56:63]);
assign out[48:55] = mul_0D(in[32:39]) ^ mul_09(in[40:47]) ^ mul_0E(in[48:55]) ^ mul_0B(in[56:63]);
assign out[56:63] = mul_0B(in[32:39]) ^ mul_0D(in[40:47]) ^ mul_09(in[48:55]) ^ mul_0E(in[56:63]);



//Column 2:
//---------
//         [64:71]  [72:79]  [80:87] [88:95]  
//cell 0,1   =>    (0E 0B 0D 09)
//cell 1,1   =>    (09 0E 0B 0D)
//cell 2,1   =>    (0D 09 0E 0B)
//cell 3,1   =>    (0B 0D 09 0E)

assign out[64:71] = mul_0E(in[64:71]) ^ mul_0B(in[72:79]) ^ mul_0D(in[80:87]) ^ mul_09(in[88:95]);
assign out[72:79] = mul_09(in[64:71]) ^ mul_0E(in[72:79]) ^ mul_0B(in[80:87]) ^ mul_0D(in[88:95]);
assign out[80:87] = mul_0D(in[64:71]) ^ mul_09(in[72:79]) ^ mul_0E(in[80:87]) ^ mul_0B(in[88:95]);
assign out[88:95] = mul_0B(in[64:71]) ^ mul_0D(in[72:79]) ^ mul_09(in[80:87]) ^ mul_0E(in[88:95]);




//Column 3:
//---------
//        [96:103] [104:111]  [112:119]  [120:127]  
//cell 0,1   =>    (0E 0B 0D 09)
//cell 1,1   =>    (09 0E 0B 0D)
//cell 2,1   =>    (0D 09 0E 0B)
//cell 3,1   =>    (0B 0D 09 0E)

assign out[96:103]  = mul_0E(in[96:103]) ^ mul_0B(in[104:111]) ^ mul_0D(in[112:119]) ^ mul_09(in[120:127]);
assign out[104:111] = mul_09(in[96:103]) ^ mul_0E(in[104:111]) ^ mul_0B(in[112:119]) ^ mul_0D(in[120:127]);
assign out[112:119] = mul_0D(in[96:103]) ^ mul_09(in[104:111]) ^ mul_0E(in[112:119]) ^ mul_0B(in[120:127]);
assign out[120:127] = mul_0B(in[96:103]) ^ mul_0D(in[104:111]) ^ mul_09(in[112:119]) ^ mul_0E(in[120:127]);


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



//we multiply 02 3 times XOR mult 02 2 times XOR mult2 

function [0:7] mul_0E(input [0:7] x);
    reg [0:7] b, c, d;
begin
    b = mul_2(x);   // multiply by {02}   //last one
    c = mul_2(b);   // multiply by {04}    //sec one
    d = mul_2(c);   // multiply by {08}   //first one
    mul_0E = d ^ c ^ b;  // xor all three results
end
endfunction



//it multiplys 2 3 times XOR mult 2 2 times XOR x
function [0:7] mul_0D(input [0:7] x);
reg [0:7] b, c, d;
begin
    b= mul_2(x); //by 02
    c = mul_2(b);  //by 04
    d = mul_2(c);  //by 08
    mul_0D =  d ^ c ^x;
end
endfunction




//  mul_0B function that uses the mul2 function
// it multiplys 02 3 times XOR multiply 2 XOR x
function [0:7] mul_0B(input [0:7] x);

reg [0:7] b, c, d;
begin
    b= mul_2(x); //by 02
    c = mul_2(b);  //by 04
    d = mul_2(c);  //by 08
    
    mul_0B = d ^ b ^ x ;
end
endfunction


//  mul_09 function that uses the mul2 function
//  it multiply 02 3 times XOR original x
function [0:7] mul_09(input [0:7] x);

reg [0:7] b, c, d;
begin
    b= mul_2(x); //by 02
    c = mul_2(b);  //by 04
    d = mul_2(c);  //by 08

    mul_09 = d ^ x;
end
endfunction

endmodule