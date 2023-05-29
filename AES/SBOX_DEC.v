module SBOX_DEC (input [7:0] InData_DEC,output reg [7:0] DataOut_DEC);

always @(InData_DEC)
begin
   case(InData_DEC)
	
//ROW0
	8'h63		: DataOut_DEC=8'h00;
	8'h7c		: DataOut_DEC=8'h01;
	8'h77		: DataOut_DEC=8'h02;
	8'h7b		: DataOut_DEC=8'h03;
	8'hf2		: DataOut_DEC=8'h04;
	8'h6b		: DataOut_DEC=8'h05;
	8'h6f		: DataOut_DEC=8'h06;
	8'hc5		: DataOut_DEC=8'h07;
	8'h30		: DataOut_DEC=8'h08;
	8'h01		: DataOut_DEC=8'h09;
	8'h67		: DataOut_DEC=8'h0a;
	8'h2b		: DataOut_DEC=8'h0b;
	8'hfe		: DataOut_DEC=8'h0c;
	8'hd7		: DataOut_DEC=8'h0d;
	8'hab		: DataOut_DEC=8'h0e;
	8'h76		: DataOut_DEC=8'h0f;
	
//ROW1

	8'hca		: DataOut_DEC=8'h10;
	8'h82		: DataOut_DEC=8'h11;
	8'hc9		: DataOut_DEC=8'h12;
	8'h7d		: DataOut_DEC=8'h13;
	8'hfa		: DataOut_DEC=8'h14;
	8'h59		: DataOut_DEC=8'h15;
	8'h47		: DataOut_DEC=8'h16;
	8'hf0		: DataOut_DEC=8'h17;
	8'had		: DataOut_DEC=8'h18;
	8'hd4		: DataOut_DEC=8'h19;
	8'ha2		: DataOut_DEC=8'h1a;
	8'haf		: DataOut_DEC=8'h1b;
	8'h9c		: DataOut_DEC=8'h1c;
	8'ha4		: DataOut_DEC=8'h1d;
	8'h72		: DataOut_DEC=8'h1e;
	8'hc0		: DataOut_DEC=8'h1f;

//ROW2

	8'hb7		: DataOut_DEC=8'h20;
	8'hfd		: DataOut_DEC=8'h21;
	8'h93		: DataOut_DEC=8'h22;
	8'h26		: DataOut_DEC=8'h23;
	8'h36		: DataOut_DEC=8'h24;
	8'h3f		: DataOut_DEC=8'h25;
	8'hf7		: DataOut_DEC=8'h26;
	8'hcc		: DataOut_DEC=8'h27;
	8'h34		: DataOut_DEC=8'h28;
	8'ha5		: DataOut_DEC=8'h29;
	8'he5		: DataOut_DEC=8'h2a;
	8'hf1		: DataOut_DEC=8'h2b;
	8'h71		: DataOut_DEC=8'h2c;
	8'hd8		: DataOut_DEC=8'h2d;
	8'h31		: DataOut_DEC=8'h2e;
	8'h15		: DataOut_DEC=8'h2f;
	
//ROW3

	8'h04		: DataOut_DEC=8'h30;
	8'hc7		: DataOut_DEC=8'h31;
	8'h23		: DataOut_DEC=8'h32;
	8'hc3		: DataOut_DEC=8'h33;
	8'h18		: DataOut_DEC=8'h34;
	8'h96		: DataOut_DEC=8'h35;
	8'h05		: DataOut_DEC=8'h36;
	8'h9a		: DataOut_DEC=8'h37;
	8'h07		: DataOut_DEC=8'h38;
	8'h12		: DataOut_DEC=8'h39;
	8'h80		: DataOut_DEC=8'h3a;
	8'he2		: DataOut_DEC=8'h3b;
	8'heb		: DataOut_DEC=8'h3c;
	8'h27		: DataOut_DEC=8'h3d;
	8'hb2		: DataOut_DEC=8'h3e;
	8'h75		: DataOut_DEC=8'h3f;
	
//ROW4

	8'h09		: DataOut_DEC=8'h40;
	8'h83		: DataOut_DEC=8'h41;
	8'h2c		: DataOut_DEC=8'h42;
	8'h1a		: DataOut_DEC=8'h43;
	8'h1b		: DataOut_DEC=8'h44;
	8'h6e		: DataOut_DEC=8'h45;
	8'h5a		: DataOut_DEC=8'h46;
	8'ha0		: DataOut_DEC=8'h47;
	8'h52		: DataOut_DEC=8'h48;
	8'h3b		: DataOut_DEC=8'h49;
	8'hd6		: DataOut_DEC=8'h4a;
	8'hb3		: DataOut_DEC=8'h4b;
	8'h29		: DataOut_DEC=8'h4c;
	8'he3		: DataOut_DEC=8'h4d;
	8'h2f		: DataOut_DEC=8'h4e;
	8'h84		: DataOut_DEC=8'h4f;	

//ROW5

	8'h53		: DataOut_DEC=8'h50;
	8'hd1		: DataOut_DEC=8'h51;
	8'h00		: DataOut_DEC=8'h52;
	8'hed		: DataOut_DEC=8'h53;
	8'h20		: DataOut_DEC=8'h54;
	8'hfc		: DataOut_DEC=8'h55;
	8'hb1		: DataOut_DEC=8'h56;
	8'h5b		: DataOut_DEC=8'h57;
	8'h6a		: DataOut_DEC=8'h58;
	8'hcb		: DataOut_DEC=8'h59;
	8'hbe		: DataOut_DEC=8'h5a;
	8'h39		: DataOut_DEC=8'h5b;
	8'h4a		: DataOut_DEC=8'h5c;
	8'h4c		: DataOut_DEC=8'h5d;
	8'h58		: DataOut_DEC=8'h5e;
	8'hcf		: DataOut_DEC=8'h5f;	

//ROW6

	8'hd0		: DataOut_DEC=8'h60;
	8'hef		: DataOut_DEC=8'h61;
	8'haa		: DataOut_DEC=8'h62;
	8'hfb		: DataOut_DEC=8'h63;
	8'h43		: DataOut_DEC=8'h64;
	8'h4d		: DataOut_DEC=8'h65;
	8'h33		: DataOut_DEC=8'h66;
	8'h85		: DataOut_DEC=8'h67;
	8'h45		: DataOut_DEC=8'h68;
	8'hf9		: DataOut_DEC=8'h69;
	8'h02		: DataOut_DEC=8'h6a;
	8'h7f		: DataOut_DEC=8'h6b;
	8'h50		: DataOut_DEC=8'h6c;
	8'h3c		: DataOut_DEC=8'h6d;
	8'h9f		: DataOut_DEC=8'h6e;
	8'ha8		: DataOut_DEC=8'h6f;	

//ROW7

	8'h51		: DataOut_DEC=8'h70;
	8'ha3		: DataOut_DEC=8'h71;
	8'h40		: DataOut_DEC=8'h72;
	8'h8f		: DataOut_DEC=8'h73;
	8'h92		: DataOut_DEC=8'h74;
	8'h9d		: DataOut_DEC=8'h75;
	8'h38		: DataOut_DEC=8'h76;
	8'hf5		: DataOut_DEC=8'h77;
	8'hbc		: DataOut_DEC=8'h78;
	8'hb6		: DataOut_DEC=8'h79;
	8'hda		: DataOut_DEC=8'h7a;
	8'h21		: DataOut_DEC=8'h7b;
	8'h10		: DataOut_DEC=8'h7c;
	8'hff		: DataOut_DEC=8'h7d;
	8'hf3		: DataOut_DEC=8'h7e;
	8'hd2		: DataOut_DEC=8'h7f;	
	
//ROW8

	8'hcd		: DataOut_DEC=8'h80;
	8'h0c		: DataOut_DEC=8'h81;
	8'h13		: DataOut_DEC=8'h82;
	8'hec		: DataOut_DEC=8'h83;
	8'h5f		: DataOut_DEC=8'h84;
	8'h97		: DataOut_DEC=8'h85;
	8'h44		: DataOut_DEC=8'h86;
	8'h17		: DataOut_DEC=8'h87;
	8'hc4		: DataOut_DEC=8'h88;
	8'ha7		: DataOut_DEC=8'h89;
	8'h7e		: DataOut_DEC=8'h8a;
	8'h3d		: DataOut_DEC=8'h8b;
	8'h64		: DataOut_DEC=8'h8c;
	8'h5d		: DataOut_DEC=8'h8d;
	8'h19		: DataOut_DEC=8'h8e;
	8'h73		: DataOut_DEC=8'h8f;	

//ROW9

	8'h60		: DataOut_DEC=8'h90;
	8'h81		: DataOut_DEC=8'h91;
	8'h4f		: DataOut_DEC=8'h92;
	8'hdc		: DataOut_DEC=8'h93;
	8'h22		: DataOut_DEC=8'h94;
	8'h2a		: DataOut_DEC=8'h95;
	8'h90		: DataOut_DEC=8'h96;
	8'h88		: DataOut_DEC=8'h97;
	8'h46		: DataOut_DEC=8'h98;
	8'hee		: DataOut_DEC=8'h99;
	8'hb8		: DataOut_DEC=8'h9a;
	8'h14		: DataOut_DEC=8'h9b;
	8'hde		: DataOut_DEC=8'h9c;
	8'h5e		: DataOut_DEC=8'h9d;
	8'h0b		: DataOut_DEC=8'h9e;
	8'hdb		: DataOut_DEC=8'h9f;		

//ROWA

	8'he0		: DataOut_DEC=8'ha0;
	8'h32		: DataOut_DEC=8'ha1;
	8'h3a		: DataOut_DEC=8'ha2;
	8'h0a		: DataOut_DEC=8'ha3;
	8'h49		: DataOut_DEC=8'ha4;
	8'h06		: DataOut_DEC=8'ha5;
	8'h24		: DataOut_DEC=8'ha6;
	8'h5c		: DataOut_DEC=8'ha7;
	8'hc2		: DataOut_DEC=8'ha8;
	8'hd3		: DataOut_DEC=8'ha9;
	8'hac		: DataOut_DEC=8'haa;
	8'h62		: DataOut_DEC=8'hab;
	8'h91		: DataOut_DEC=8'hac;
	8'h95		: DataOut_DEC=8'had;
	8'he4		: DataOut_DEC=8'hae;
	8'h79		: DataOut_DEC=8'haf;	

//ROWB

	8'he7		: DataOut_DEC=8'hb0;
	8'hc8		: DataOut_DEC=8'hb1;
	8'h37		: DataOut_DEC=8'hb2;
	8'h6d		: DataOut_DEC=8'hb3;
	8'h8d		: DataOut_DEC=8'hb4;
	8'hd5		: DataOut_DEC=8'hb5;
	8'h4e		: DataOut_DEC=8'hb6;
	8'ha9		: DataOut_DEC=8'hb7;
	8'h6c		: DataOut_DEC=8'hb8;
	8'h56		: DataOut_DEC=8'hb9;
	8'hf4		: DataOut_DEC=8'hba;
	8'hea		: DataOut_DEC=8'hbb;
	8'h65		: DataOut_DEC=8'hbc;
	8'h7a		: DataOut_DEC=8'hbd;
	8'hae		: DataOut_DEC=8'hbe;
	8'h08		: DataOut_DEC=8'hbf;		
	
//ROWC

	8'hba		: DataOut_DEC=8'hc0;
	8'h78		: DataOut_DEC=8'hc1;
	8'h25		: DataOut_DEC=8'hc2;
	8'h2e		: DataOut_DEC=8'hc3;
	8'h1c		: DataOut_DEC=8'hc4;
	8'ha6		: DataOut_DEC=8'hc5;
	8'hb4		: DataOut_DEC=8'hc6;
	8'hc6		: DataOut_DEC=8'hc7;
	8'he8		: DataOut_DEC=8'hc8;
	8'hdd		: DataOut_DEC=8'hc9;
	8'h74		: DataOut_DEC=8'hca;
	8'h1f		: DataOut_DEC=8'hcb;
	8'h4b		: DataOut_DEC=8'hcc;
	8'hbd		: DataOut_DEC=8'hcd;
	8'h8b		: DataOut_DEC=8'hce;
	8'h8a		: DataOut_DEC=8'hcf;	

//ROWD

	8'h70		: DataOut_DEC=8'hd0;
	8'h3e		: DataOut_DEC=8'hd1;
	8'hb5		: DataOut_DEC=8'hd2;
	8'h66		: DataOut_DEC=8'hd3;
	8'h48		: DataOut_DEC=8'hd4;
	8'h03		: DataOut_DEC=8'hd5;
	8'hf6		: DataOut_DEC=8'hd6;
	8'h0e		: DataOut_DEC=8'hd7;
	8'h61		: DataOut_DEC=8'hd8;
	8'h35		: DataOut_DEC=8'hd9;
	8'h57		: DataOut_DEC=8'hda;
	8'hb9		: DataOut_DEC=8'hdb;
	8'h86		: DataOut_DEC=8'hdc;
	8'hc1		: DataOut_DEC=8'hdd;
	8'h1d		: DataOut_DEC=8'hde;
	8'h9e		: DataOut_DEC=8'hdf;	

//ROWE

	8'he1		: DataOut_DEC=8'he0;
	8'hf8		: DataOut_DEC=8'he1;
	8'h98		: DataOut_DEC=8'he2;
	8'h11		: DataOut_DEC=8'he3;
	8'h69		: DataOut_DEC=8'he4;
	8'hd9		: DataOut_DEC=8'he5;
	8'h8e		: DataOut_DEC=8'he6;
	8'h94		: DataOut_DEC=8'he7;
	8'h9b		: DataOut_DEC=8'he8;
	8'h1e		: DataOut_DEC=8'he9;
	8'h87		: DataOut_DEC=8'hea;
	8'he9		: DataOut_DEC=8'heb;
	8'hce		: DataOut_DEC=8'hec;
	8'h55		: DataOut_DEC=8'hed;
	8'h28		: DataOut_DEC=8'hee;
	8'hdf		: DataOut_DEC=8'hef;

//ROWF

	8'h8c		: DataOut_DEC=8'hf0;
	8'ha1		: DataOut_DEC=8'hf1;
	8'h89		: DataOut_DEC=8'hf2;
	8'h0d		: DataOut_DEC=8'hf3;
	8'hbf		: DataOut_DEC=8'hf4;
	8'he6		: DataOut_DEC=8'hf5;
	8'h42		: DataOut_DEC=8'hf6;
	8'h68		: DataOut_DEC=8'hf7;
	8'h41		: DataOut_DEC=8'hf8;
	8'h99		: DataOut_DEC=8'hf9;
	8'h2d		: DataOut_DEC=8'hfa;
	8'h0f		: DataOut_DEC=8'hfb;
	8'hb0		: DataOut_DEC=8'hfc;
	8'h54		: DataOut_DEC=8'hfd;
	8'hbb		: DataOut_DEC=8'hfe;
	8'h16		: DataOut_DEC=8'hff;	
	
	endcase
	end
	
endmodule
