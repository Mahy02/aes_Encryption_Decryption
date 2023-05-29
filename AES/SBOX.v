module SBOX (input [7:0] InData,output reg [7:0] DataOut);

always @(InData)
begin
   case(InData)
//Row 0
8'h00		: DataOut=8'h63;
8'h01		: DataOut=8'h7c;
8'h02		: DataOut=8'h77;
8'h03		: DataOut=8'h7b;
8'h04		: DataOut=8'hf2;
8'h05		: DataOut=8'h6b;
8'h06		: DataOut=8'h6f;
8'h07		: DataOut=8'hc5;
8'h08		: DataOut=8'h30;
8'h09		: DataOut=8'h01;
8'h0a		: DataOut=8'h67;
8'h0b		: DataOut=8'h2b;
8'h0c		: DataOut=8'hfe;
8'h0d		: DataOut=8'hd7;
8'h0e		: DataOut=8'hab;
8'h0f		: DataOut=8'h76;

//Row 1
8'h10		: DataOut=8'hca;
8'h11		: DataOut=8'hb2;
8'h12		: DataOut=8'hc9;
8'h13		: DataOut=8'h7d;
8'h14		: DataOut=8'hfa;
8'h15		: DataOut=8'h59;
8'h16		: DataOut=8'h47;
8'h17		: DataOut=8'hf0;
8'h18		: DataOut=8'had;
8'h19		: DataOut=8'hd4;
8'h1a		: DataOut=8'ha2;
8'h1b		: DataOut=8'haf;
8'h1c		: DataOut=8'h9c;
8'h1d		: DataOut=8'ha4;
8'h1e		: DataOut=8'h72;
8'h1f		: DataOut=8'hc0;

//Row 2
8'h20		: DataOut=8'hb7;
8'h21		: DataOut=8'hfd;
8'h22		: DataOut=8'h93;
8'h23		: DataOut=8'h26;
8'h24		: DataOut=8'h36;
8'h25		: DataOut=8'h3f;
8'h26		: DataOut=8'hf7;
8'h27		: DataOut=8'hcc;
8'h28		: DataOut=8'h34;
8'h29		: DataOut=8'ha5;
8'h2a		: DataOut=8'he5;
8'h2b		: DataOut=8'hf1;
8'h2c		: DataOut=8'h71;
8'h2d		: DataOut=8'hd8;
8'h2e		: DataOut=8'h31;
8'h2f		: DataOut=8'h15;

//Row 3
8'h30		: DataOut=8'h04;
8'h31		: DataOut=8'hc7;
8'h32		: DataOut=8'h23;
8'h33		: DataOut=8'hc3;
8'h34		: DataOut=8'h18;
8'h35		: DataOut=8'h96;
8'h36		: DataOut=8'h05;
8'h37		: DataOut=8'h9a;
8'h38		: DataOut=8'h07;
8'h39		: DataOut=8'h12;
8'h3a		: DataOut=8'h80;
8'h3b		: DataOut=8'he2;
8'h3c		: DataOut=8'heb;
8'h3d		: DataOut=8'h27;
8'h3e		: DataOut=8'hb2;
8'h3f		: DataOut=8'h75;

//Row 4
8'h40		: DataOut=8'h09;
8'h41		: DataOut=8'h83;
8'h42		: DataOut=8'h2c;
8'h43		: DataOut=8'h1a;
8'h44		: DataOut=8'h1b;
8'h45		: DataOut=8'h6e;
8'h46		: DataOut=8'h5a;
8'h47		: DataOut=8'ha0;
8'h48		: DataOut=8'h52;
8'h49		: DataOut=8'h3b;
8'h4a		: DataOut=8'hd6;
8'h4b		: DataOut=8'hb3;
8'h4c		: DataOut=8'h29;
8'h4d		: DataOut=8'he3;
8'h4e		: DataOut=8'h2f;
8'h4f		: DataOut=8'h84;

//Row 5
8'h50		: DataOut=8'h53;
8'h51		: DataOut=8'hd1;
8'h52		: DataOut=8'h00;
8'h53		: DataOut=8'hed;
8'h54		: DataOut=8'h20;
8'h55		: DataOut=8'hfc;
8'h56		: DataOut=8'hb1;
8'h57		: DataOut=8'h5b;
8'h58		: DataOut=8'h6a;
8'h59		: DataOut=8'hcb;
8'h5a		: DataOut=8'hbe;
8'h5b		: DataOut=8'h39;
8'h5c		: DataOut=8'h4a;
8'h5d		: DataOut=8'h4c;
8'h5e		: DataOut=8'h58;
8'h5f		: DataOut=8'hcf;

//Row 6
8'h60		: DataOut=8'hd0;
8'h61		: DataOut=8'hef;
8'h62		: DataOut=8'haa;
8'h63		: DataOut=8'hfb;
8'h64		: DataOut=8'h43;
8'h65		: DataOut=8'h4d;
8'h66		: DataOut=8'h33;
8'h67		: DataOut=8'h85;
8'h68		: DataOut=8'h45;
8'h69		: DataOut=8'hf9;
8'h6a		: DataOut=8'h02;
8'h6b		: DataOut=8'h7f;
8'h6c		: DataOut=8'h50;
8'h6d		: DataOut=8'h3c;
8'h6e		: DataOut=8'h9f;
8'h6f		: DataOut=8'ha8;

//Row 7
8'h70		: DataOut=8'h51;
8'h71		: DataOut=8'ha3;
8'h72		: DataOut=8'h40;
8'h73		: DataOut=8'h8f;
8'h74		: DataOut=8'h92;
8'h75		: DataOut=8'h9d;
8'h76		: DataOut=8'h38;
8'h77		: DataOut=8'hf5;
8'h78		: DataOut=8'hbc;
8'h79		: DataOut=8'hb6;
8'h7a		: DataOut=8'hda;
8'h7b		: DataOut=8'h21;
8'h7c		: DataOut=8'h10;
8'h7d		: DataOut=8'hff;
8'h7e		: DataOut=8'hf3;
8'h7f		: DataOut=8'hd2;

//Row 8
8'h80		: DataOut=8'hcd;
8'h81		: DataOut=8'h0c;
8'h82		: DataOut=8'h13;
8'h83		: DataOut=8'hec;
8'h84		: DataOut=8'h5f;
8'h85		: DataOut=8'h97;
8'h86		: DataOut=8'h44;
8'h87		: DataOut=8'h17;
8'h88		: DataOut=8'hc4;
8'h89		: DataOut=8'ha7;
8'h8a		: DataOut=8'h7e;
8'h8b		: DataOut=8'h3d;
8'h8c		: DataOut=8'h64;
8'h8d		: DataOut=8'h5d;
8'h8e		: DataOut=8'h19;
8'h8f		: DataOut=8'h73;

//Row 9
8'h90		: DataOut=8'h60;
8'h91		: DataOut=8'h81;
8'h92		: DataOut=8'h4f;
8'h93		: DataOut=8'hdc;
8'h94		: DataOut=8'h22;
8'h95		: DataOut=8'h2a;
8'h96		: DataOut=8'h90;
8'h97		: DataOut=8'h88;
8'h98		: DataOut=8'h46;
8'h99		: DataOut=8'hee;
8'h9a		: DataOut=8'hb8;
8'h9b		: DataOut=8'h14;
8'h9c		: DataOut=8'hde;
8'h9d		: DataOut=8'h5e;
8'h9e		: DataOut=8'h0b;
8'h9f		: DataOut=8'hdb;

//Row A
8'ha0		: DataOut=8'he0;
8'ha1		: DataOut=8'h32;
8'ha2		: DataOut=8'h3a;
8'ha3		: DataOut=8'h0a;
8'ha4		: DataOut=8'h49;
8'ha5		: DataOut=8'h06;
8'ha6		: DataOut=8'h24;
8'ha7		: DataOut=8'h5c;
8'ha8		: DataOut=8'hc2;
8'ha9		: DataOut=8'hd3;
8'haa		: DataOut=8'hac;
8'hab		: DataOut=8'h62;
8'hac		: DataOut=8'h91;
8'had		: DataOut=8'h95;
8'hae		: DataOut=8'he4;
8'haf		: DataOut=8'h79;

//Row B
8'hb0		: DataOut=8'he7;
8'hb1		: DataOut=8'hc8;
8'hb2		: DataOut=8'h37;
8'hb3		: DataOut=8'h6d;
8'hb4		: DataOut=8'h8d;
8'hb5		: DataOut=8'hd5;
8'hb6		: DataOut=8'h4e;
8'hb7		: DataOut=8'ha9;
8'hb8		: DataOut=8'h6c;
8'hb9		: DataOut=8'h56;
8'hba		: DataOut=8'hf4;
8'hbb		: DataOut=8'hea;
8'hbc		: DataOut=8'h65;
8'hbd		: DataOut=8'h7a;
8'hbe		: DataOut=8'hae;
8'hbf		: DataOut=8'h08;

//Row C
8'hc0		: DataOut=8'hba;
8'hc1		: DataOut=8'h78;
8'hc2		: DataOut=8'h25;
8'hc3		: DataOut=8'h2e;
8'hc4		: DataOut=8'h1c;
8'hc5		: DataOut=8'ha6;
8'hc6		: DataOut=8'hb4;
8'hc7		: DataOut=8'hc6;
8'hc8		: DataOut=8'he8;
8'hc9		: DataOut=8'hdd;
8'hca		: DataOut=8'h74;
8'hcb		: DataOut=8'h1f;
8'hcc		: DataOut=8'h4b;
8'hcd		: DataOut=8'hbd;
8'hce		: DataOut=8'h8b;
8'hcf		: DataOut=8'h8a;

//Row D
8'hd0		: DataOut=8'h70;
8'hd1		: DataOut=8'h3e;
8'hd2		: DataOut=8'hb5;
8'hd3		: DataOut=8'h66;
8'hd4		: DataOut=8'h48;
8'hd5		: DataOut=8'h03;
8'hd6		: DataOut=8'hf6;
8'hd7		: DataOut=8'h0e;
8'hd8		: DataOut=8'h61;
8'hd9		: DataOut=8'h35;
8'hda		: DataOut=8'h57;
8'hdb		: DataOut=8'hb9;
8'hdc		: DataOut=8'h86;
8'hdd		: DataOut=8'hc1;
8'hde		: DataOut=8'h1d;
8'hdf		: DataOut=8'h9e;

//Row E
8'he0		: DataOut=8'he1;
8'he1		: DataOut=8'hf8;
8'he2		: DataOut=8'h98;
8'he3		: DataOut=8'h11;
8'he4		: DataOut=8'h69;
8'he5		: DataOut=8'hd9;
8'he6		: DataOut=8'h8e;
8'he7		: DataOut=8'h94;
8'he8		: DataOut=8'h9b;
8'he9		: DataOut=8'h1e;
8'hea		: DataOut=8'h87;
8'heb		: DataOut=8'he9;
8'hec		: DataOut=8'hce;
8'hed		: DataOut=8'h55;
8'hee		: DataOut=8'h28;
8'hef		: DataOut=8'hdf;

//Row F
8'hf0		: DataOut=8'h8c;
8'hf1		: DataOut=8'ha1;
8'hf2		: DataOut=8'h89;
8'hf3		: DataOut=8'h0d;
8'hf4		: DataOut=8'hbf;
8'hf5		: DataOut=8'he6;
8'hf6		: DataOut=8'h42;
8'hf7		: DataOut=8'h68;
8'hf8		: DataOut=8'h41;
8'hf9		: DataOut=8'h99;
8'hfa		: DataOut=8'h2d;
8'hfb		: DataOut=8'h0f;
8'hfc		: DataOut=8'hb0;
8'hfd		: DataOut=8'h54;
8'hfe		: DataOut=8'hbb;
8'hff		: DataOut=8'h16;

endcase

end


endmodule
