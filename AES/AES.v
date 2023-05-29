//here we will put both encryption and decryption to be tested later using multiple tetscases by a testbench + a wrapper:

module AES(
output wire encrypt_128,
output wire decrypt_128,
output wire encrypt_192,
output wire decrypt_192,
output wire encrypt_256,
output wire decrypt_256,


// The  text used as input that we want to encrypt then decrypt 
input [0:127] in ,
//= 128'h_00112233445566778899aabbccddeeff;


input [0:127] key_128,
//= 128'h_000102030405060708090a0b0c0d0e0f;
input [0:191] key_192,
//= 192'h_000102030405060708090a0b0c0d0e0f1011121314151617;
input [0:255] key_256,
//= 256'h_000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;


input [0:127] expected_128 ,
//= 128'h_69c4e0d86a7b0430d8cdb78070b4c55a;
input [0:127] expected_192 ,
//= 128'h_dda97ca4864cdfe06eaf70a0ec0d7191;
input [0:127] expected_256 
//= 128'h_8ea2b7ca516745bfeafc49904b496089;

);



wire[0:127] encrypted_128;
wire[0:127] encrypted_192;
wire[0:127] encrypted_256;


wire[0:127] decrypted_128;
wire[0:127] decrypted_192;
wire[0:127] decrypted_256;


Encyrption enc_1(in,key_128,encrypted_128);
Encyrption #(192,12,6) enc_2(in,key_192,encrypted_192);
Encyrption #(256,14,8) enc_3(in,key_256,encrypted_256);



assign encrypt_128 = (encrypted_128 == expected_128);
assign encrypt_192 = (encrypted_192 == expected_192);
assign encrypt_256 = (encrypted_256 == expected_256);


Decryption dec_1(encrypted_128,key_128,decrypted_128);
Decryption #(192,12,6) dec_2(encrypted_192,key_192,decrypted_192);
Decryption #(256,14,8) dec_3(encrypted_256,key_256,decrypted_256);

assign decrypt_128 = (decrypted_128 == in);
assign decrypt_192 = (decrypted_192 == in);
assign decrypt_256 = (decrypted_256 == in);

endmodule
