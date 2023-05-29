
//Shape of matrix:

// 0:7    32:39   64:71   96:103
// 8:15   40:47   72:79   104:111
// 16:23  48:55   80:87   112:119
// 24:31  56:63   88:95   120:127


module Inverse_ShiftRow (
input [0:127] Data_In,
output [0:127] Data_Out
);
//wires in the form of a matrix
wire [0:7] wire_in[0:3][0:3];
wire [0:7] wire_out[0:3][0:3];

///////////////////////////Setting Data In/////////////////////////////////
assign wire_in[0][0]=Data_In[0:7];
assign wire_in[1][0]=Data_In[8:15];
assign wire_in[2][0]=Data_In[16:23];
assign wire_in[3][0]=Data_In[24:31];


assign wire_in[0][1]=Data_In[32:39];
assign wire_in[1][1]=Data_In[40:47];
assign wire_in[2][1]=Data_In[48:55];
assign wire_in[3][1]=Data_In[56:63];


assign wire_in[0][2]=Data_In[64:71];
assign wire_in[1][2]=Data_In[72:79];
assign wire_in[2][2]=Data_In[80:87];
assign wire_in[3][2]=Data_In[88:95];


assign wire_in[0][3]=Data_In[96:103];
assign wire_in[1][3]=Data_In[104:111];
assign wire_in[2][3]=Data_In[112:119];
assign wire_in[3][3]=Data_In[120:127];

//////////////////////////////////Shifting Method//////////////////////////////////////
assign wire_out[0][0]=wire_in[0][0];
assign wire_out[0][1]=wire_in[0][1];
assign wire_out[0][2]=wire_in[0][2];
assign wire_out[0][3]=wire_in[0][3];


assign wire_out[1][0]=wire_in[1][3];
assign wire_out[1][1]=wire_in[1][0];
assign wire_out[1][2]=wire_in[1][1];
assign wire_out[1][3]=wire_in[1][2];


assign wire_out[2][0]=wire_in[2][2];
assign wire_out[2][1]=wire_in[2][3];
assign wire_out[2][2]=wire_in[2][0];
assign wire_out[2][3]=wire_in[2][1];

assign wire_out[3][0]=wire_in[3][1];
assign wire_out[3][1]=wire_in[3][2];
assign wire_out[3][2]=wire_in[3][3];
assign wire_out[3][3]=wire_in[3][0];


//////////////////////////setting Data Out//////////////////////////////
assign Data_Out[0:7]=wire_out[0][0]; 
assign Data_Out[8:15]=wire_out[1][0];
assign Data_Out[16:23]=wire_out[2][0]; 
assign Data_Out[24:31]=wire_out[3][0]; 


assign Data_Out[32:39]=wire_out[0][1];
assign Data_Out[40:47]=wire_out[1][1]; 
assign Data_Out[48:55]=wire_out[2][1];
assign Data_Out[56:63]=wire_out[3][1];


assign Data_Out[64:71]=wire_out[0][2];
assign Data_Out[72:79]=wire_out[1][2];
assign Data_Out[80:87]=wire_out[2][2];
assign Data_Out[88:95]=wire_out[3][2];


assign Data_Out[96:103]=wire_out[0][3];
assign Data_Out[104:111]=wire_out[1][3];
assign Data_Out[112:119]=wire_out[2][3];
assign Data_Out[120:127]=wire_out[3][3];




endmodule 