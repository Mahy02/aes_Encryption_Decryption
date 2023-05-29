module AddRoundKey
(
input [0:127] datain,
input [0:127] key,
output [0:127] dataout
);

assign dataout = key ^ datain;

endmodule