//module TB();
////enable??
//
//reg [0:127] in;
//reg [0:127] key_128;
////= 128'h_000102030405060708090a0b0c0d0e0f;
//reg [0:191] key_192;
////= 192'h_000102030405060708090a0b0c0d0e0f1011121314151617;
//reg [0:255] key_256 ;
////= 256'h_000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
//
//reg clk;
//reg rst;
//reg en;
//wire led;
//
//
//
////Wrapper_256 a(encrypt_128, decrypt_128, encrypt_192, decrypt_192, encrypt_256, decrypt_256, in, key_128, key_192,key_256,expected_128,expected_192, expected_256);
//
//Wrapper_256 w(clk, rst, en, led);
//
////AES b(encrypt_128_2, decrypt_128_2, encrypt_192_2, decrypt_192_2, encrypt_256_2, decrypt_256_2, in_2, key_128_2, key_192_2,key_256_2,expected_128_2,expected_192_2, expected_256_2);
//
//initial begin
//	$monitor("encryption_128 = %b, decryption_128 = %b, encryption_192 = %b, decryption_192 = %b, encryption_256 = %b, decryption_256 = %b",
//		encrypt_128, decrypt_128, encrypt_192, decrypt_192, encrypt_256, decrypt_256);
//		
//
//
//
//    //first test case:
//	 in =128'h_00112233445566778899aabbccddeeff;
//	
////    key_128 = 128'h_000102030405060708090a0b0c0d0e0f;
////    key_192 = 192'h_000102030405060708090a0b0c0d0e0f1011121314151617;
//    key_256 = 256'h_000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
////    expected_128= 128'h_69c4e0d86a7b0430d8cdb78070b4c55a;
////    expected_192=128'h_dda97ca4864cdfe06eaf70a0ec0d7191;
//    expected_256=128'h_8ea2b7ca516745bfeafc49904b496089;
//	 #50;
//	  
//	 
//	 
//	 
//	
//	
//    //second test case:
//	 in =128'h_32431238feca308d317908a2eb3ff224;
////    key_128 = 128'h_2bfb4516287962a6a279158809ccab3c;
////    key_192 = 192'h_56010403040578d7f6f90a0b0c0d0c4810bee213aa543617;
//    key_256 = 256'h_00fae203011106070802220b0c0d0e0f10ef521332451617181998ab1c1d567f;
////    expected_128= 128'h_2b193424d8de4648e598dcf7d78504dd;
////    expected_192=128'h_93f28a883f4d5d0accefaf21d89e65c5;
//    expected_256=128'h_38cc2b13b07fdb8288d91b109d2fe180;
//	#10;
//	
//	
//	 
//	
//	
//	
//	
//	#10;
//end
//
//endmodule
