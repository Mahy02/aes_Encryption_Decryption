module SBOX_TB();
reg [7:0] InData;
wire [7:0] DataOut;

initial begin
InData = 8'h01;
#10
InData = 8'h1a;
#10
InData = 8'h9a;
#10
InData = 8'hff;
$finish;
end
SBOX S1(
.InData(InData),
.DataOut(DataOut)
);


endmodule
