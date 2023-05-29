module Decryption_TB;
reg  [0:127] DataIn1;
reg  [0:127] first_Key;
wire [0:127] DataOut1;


reg  [0:127] DataIn2;
reg  [0:191] second_Key;
wire [0:127] DataOut2;


reg  [0:127] DataIn3;
reg  [0:255] third_Key;
wire [0:127] DataOut3;


Decryption             size128(DataIn1,first_Key,DataOut1);
Decryption #(192,12,6) size192(DataIn2,second_Key,DataOut2);
Decryption #(256,14,8) size256(DataIn3,third_Key,DataOut3);


initial begin
////first Trial
$monitor("in128= %h, key128= %h ,out128= %h",DataIn1,first_Key,DataOut1);
DataIn1=128'h69c4e0d86a7b0430d8cdb78070b4c55a;
first_Key=128'h000102030405060708090a0b0c0d0e0f;
#10;

//second Trial
$monitor("in192= %h, key192= %h ,out192= %h",DataIn2,second_Key,DataOut2);
DataIn2=128'hdda97ca4864cdfe06eaf70a0ec0d7191;
second_Key=192'h000102030405060708090a0b0c0d0e0f1011121314151617;
#10;
//
//third Trial
$monitor("in256= %h, key256= %h ,out256= %h",DataIn3,third_Key,DataOut3);
DataIn3=128'h8ea2b7ca516745bfeafc49904b496089;
third_Key=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
#10;


////forth Trial
//$monitor("in256= %h, key256= %h ,out256= %h",DataIn3,third_Key,DataOut3);
//DataIn3=128'h_38cc2b13b07fdb8288d91b109d2fe180;
//third_Key=256'h_00fae203011106070802220b0c0d0e0f10ef521332451617181998ab1c1d567f;
//#10;


//128'h_93f28a883f4d5d0accefaf21d89e65c5
//256'h_000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
end

endmodule