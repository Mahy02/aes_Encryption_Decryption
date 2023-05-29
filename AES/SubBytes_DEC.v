module SubBytes_DEC(Input_DEC,Output_DEC);

input [0:127] Input_DEC;
output[0:127] Output_DEC;
wire [0:127] Output_DEC;

SBOX_DEC call1_DEC  (Input_DEC[120:127], Output_DEC[120:127]);
SBOX_DEC call2_DEC  (Input_DEC[112:119], Output_DEC[112:119]);
SBOX_DEC call3_DEC  (Input_DEC[104:111], Output_DEC[104:111]);
SBOX_DEC call4_DEC  (Input_DEC[96:103], Output_DEC[96:103]);
  
SBOX_DEC call5_DEC  (Input_DEC[88:95], Output_DEC[88:95]);
SBOX_DEC call6_DEC  (Input_DEC[80:87], Output_DEC[80:87]);
SBOX_DEC call7_DEC  (Input_DEC[72:79], Output_DEC[72:79]);
SBOX_DEC call8_DEC  (Input_DEC[64:71], Output_DEC[64:71]);

SBOX_DEC call9_DEC   (Input_DEC[56:63], Output_DEC[56:63]);
SBOX_DEC call10_DEC  (Input_DEC[48:55], Output_DEC[48:55]);
SBOX_DEC call11_DEC  (Input_DEC[40:47], Output_DEC[40:47]);
SBOX_DEC call12_DEC  (Input_DEC[32:39], Output_DEC[32:39]);
  
SBOX_DEC call13_DEC  (Input_DEC[24:31], Output_DEC[24:31]);
SBOX_DEC call14_DEC  (Input_DEC[16:23], Output_DEC[16:23]);
SBOX_DEC call15_DEC  (Input_DEC[8:15],  Output_DEC[8:15]);
SBOX_DEC call16_DEC  (Input_DEC[0:7],   Output_DEC[0:7]);


endmodule
