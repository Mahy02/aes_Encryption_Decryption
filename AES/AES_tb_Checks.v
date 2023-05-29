module AES_tb_Checks();
//enable??
 integer counterSuccess=0;
 integer counterFailure=0;
 wire encrypt_128;
 wire decrypt_128;
 wire encrypt_192;
 wire decrypt_192;
 wire encrypt_256;
 wire decrypt_256;
 reg [0:127] in;
//= 128'h_00112233445566778899aabbccddeeff;
reg [0:127] key_128;
//= 128'h_000102030405060708090a0b0c0d0e0f;
reg [0:191] key_192;
//= 192'h_000102030405060708090a0b0c0d0e0f1011121314151617;
reg [0:255] key_256 ;
//= 256'h_000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
reg [0:127] expected_128 ;
//= 128'h_69c4e0d86a7b0430d8cdb78070b4c55a;
reg [0:127] expected_192 ;
//= 128'h_dda97ca4864cdfe06eaf70a0ec0d7191;
reg [0:127] expected_256 ;
//= 128'h_8ea2b7ca516745bfeafc49904b496089;


//
// wire encrypt_128_2;
// wire decrypt_128_2;
// wire encrypt_192_2;
// wire decrypt_192_2;
// wire encrypt_256_2;
// wire decrypt_256_2;
// reg [0:127] in_2;
////= 128'h_32431238feca308d317908a2eb3ff224;
//reg [0:127] key_128_2;
////= 128'h_2bfb4516287962a6a279158809ccab3c;
//reg [0:191] key_192_2;
////= 192'h_56010403040578d7f6f90a0b0c0d0c4810bee213aa543617;
//reg [0:255] key_256_2 ;
////= 256'h_00fae203011106070802220b0c0d0e0f10ef521332451617181998ab1c1d567f;
//reg [0:127] expected_128_2 ;
////= 128'h_2b193424d8de4648e598dcf7d78504dd;
//reg [0:127] expected_192_2 ;
////= 128'h_93f28a883f4d5d0accefaf21d89e65c5;
//reg [0:127] expected_256_2 ;
////= 128'h_38cc2b13b07fdb8288d91b109d2fe180;


AES a(encrypt_128, decrypt_128, encrypt_192, decrypt_192, encrypt_256, decrypt_256, in, key_128, key_192,key_256,expected_128,expected_192, expected_256);
//AES b(encrypt_128_2, decrypt_128_2, encrypt_192_2, decrypt_192_2, encrypt_256_2, decrypt_256_2, in_2, key_128_2, key_192_2,key_256_2,expected_128_2,expected_192_2, expected_256_2);

initial begin
	$monitor("encryption_128 = %b, decryption_128 = %b, encryption_192 = %b, decryption_192 = %b, encryption_256 = %b, decryption_256 = %b",
		encrypt_128, decrypt_128, encrypt_192, decrypt_192, encrypt_256, decrypt_256);
		
//	$monitor("encryption_128 = %b, decryption_128 = %b, encryption_192 = %b, decryption_192 = %b, encryption_256 = %b, decryption_256 = %b",
//		encrypt_128_2, decrypt_128_2, encrypt_192_2, decrypt_192_2, encrypt_256_2, decrypt_256_2);
		


    //first test case:
	 in =128'h_00112233445566778899aabbccddeeff;
	
    key_128 = 128'h_000102030405060708090a0b0c0d0e0f;
    key_192 = 192'h_000102030405060708090a0b0c0d0e0f1011121314151617;
    key_256 = 256'h_000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
    expected_128= 128'h_69c4e0d86a7b0430d8cdb78070b4c55a;
    expected_192=128'h_dda97ca4864cdfe06eaf70a0ec0d7191;
    expected_256=128'h_8ea2b7ca516745bfeafc49904b496089;
	 #50;
	  
	 if(encrypt_128== 1)
	 begin
	    $display("successfully encrypt_128");
		 counterSuccess=counterSuccess+1;
	 end
	 else if(encrypt_128== 0)
	 begin
	  $display("Failed to encrypt_128");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(encrypt_192==1)
	 begin
		 $display("successfully encrypt_192");
		  counterSuccess=counterSuccess+1;
	 end
	 else if (encrypt_192==0)
	 begin
	    $display("Failed to encrypt_192");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(encrypt_256==1)
	 begin
		$display("successfully encrypt_256");
		 counterSuccess=counterSuccess+1;
		
	 end
	else if (encrypt_256==0)
	 begin
	    $display("Failed to encrypt_256");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(decrypt_128== 1)
	 begin
	  $display("successfully decrypt_128");
	  counterSuccess=counterSuccess+1;
	 
	 end
	 else if (decrypt_128==0)
	 begin
	    $display("Failed to decrypt_128");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(decrypt_192==1)
	  begin
	   $display("successfully decrypt_192");
	  counterSuccess=counterSuccess+1;
	 
	 end 
	 else if(decrypt_192==0)
	 begin
	    $display("Failed to decrypt_192");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(decrypt_256==1)
	  begin
	   $display("successfully decrypt_256");
	  counterSuccess=counterSuccess+1;
	 
	 end
	 else if (decrypt_256==0)
	 begin
	   $display("Failed to decrypt_256");
	    counterFailure=counterFailure+1;
	 end
	
	
    //second test case:
	 in =128'h_32431238feca308d317908a2eb3ff224;
    key_128 = 128'h_2bfb4516287962a6a279158809ccab3c;
    key_192 = 192'h_56010403040578d7f6f90a0b0c0d0c4810bee213aa543617;
    key_256 = 256'h_00fae203011106070802220b0c0d0e0f10ef521332451617181998ab1c1d567f;
    expected_128= 128'h_2b193424d8de4648e598dcf7d78504dd;
    expected_192=128'h_93f28a883f4d5d0accefaf21d89e65c5;
    expected_256=128'h_38cc2b13b07fdb8288d91b109d2fe180;
	#10;
	
	 if(encrypt_128== 1)
	 begin
	    $display("successfully encrypt_128");
		 counterSuccess=counterSuccess+1;
	 end
	 else if(encrypt_128== 0)
	 begin
	  $display("Failed to encrypt_128");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(encrypt_192==1)
	 begin
		 $display("successfully encrypt_192");
		  counterSuccess=counterSuccess+1;
	 end
	 else if (encrypt_192==0)
	 begin
	    $display("Failed to encrypt_192");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(encrypt_256==1)
	 begin
		$display("successfully encrypt_256");
		 counterSuccess=counterSuccess+1;
		
	 end
	else if (encrypt_256==0)
	 begin
	    $display("Failed to encrypt_256");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(decrypt_128== 1)
	 begin
	  $display("successfully decrypt_128");
	  counterSuccess=counterSuccess+1;
	 
	 end
	 else if (decrypt_128==0)
	 begin
	    $display("Failed to decrypt_128");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(decrypt_192==1)
	  begin
	   $display("successfully decrypt_192");
	  counterSuccess=counterSuccess+1;
	 
	 end 
	 else if(decrypt_192==0)
	 begin
	    $display("Failed to decrypt_192");
	    counterFailure=counterFailure+1;
	 end
	 
	 if(decrypt_256==1)
	  begin
	   $display("successfully decrypt_256");
	  counterSuccess=counterSuccess+1;
	 
	 end
	 else if (decrypt_256==0)
	 begin
	   $display("Failed to decrypt_256");
	    counterFailure=counterFailure+1;
	 end
	
	
	
	
	#10;
end

endmodule
