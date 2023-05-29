module SBOX_DEC_TB();
reg  [7:0] InData_DEC;
wire [7:0] DataOut_DEC;


initial begin
InData_DEC = 8'h63;
#10
InData_DEC = 8'hca;
#10
InData_DEC = 8'h76;
#10
InData_DEC = 8'hc0;
#10
$finish;
end

SBOX_DEC SDEC1(
.InData_DEC(InData_DEC),
.DataOut_DEC(DataOut_DEC)
);

endmodule
