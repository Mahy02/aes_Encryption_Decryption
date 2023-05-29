module SubBytes(Input,Output);

input [0:127] Input;
//reg [127:0] Input;
output[0:127] Output;
wire [0:127] Output;

SBOX call1 (Input[120:127], Output[120:127]);
SBOX call2 (Input[112:119], Output[112:119]);
SBOX call3 (Input[104:111], Output[104:111]);
SBOX call4 (Input[96:103], Output[96:103]);

SBOX call5 (Input[88:95], Output[88:95]);
SBOX call6 (Input[80:87], Output[80:87]);
SBOX call7 (Input[72:79], Output[72:79]);
SBOX call8 (Input[64:71], Output[64:71]);

SBOX call9 (Input[56:63], Output[56:63]);
SBOX call10(Input[48:55], Output[48:55]);
SBOX call11(Input[40:47], Output[40:47]);
SBOX call12(Input[32:39], Output[32:39]);

SBOX call13(Input[24:31], Output[24:31]);
SBOX call14(Input[16:23], Output[16:23]);
SBOX call15(Input[8:15],  Output[8:15]);
SBOX call16(Input[0:7],   Output[0:7]);


endmodule




