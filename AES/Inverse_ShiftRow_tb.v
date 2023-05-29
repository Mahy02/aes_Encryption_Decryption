module Inverse_ShiftRow_tb();

//inputs
reg [0:127] Data_In;


//outputs
wire [0:127] Data_Out;

//instantiate
Inverse_ShiftRow Inverse_ShiftRow_inst(
.Data_In(Data_In),
.Data_Out(Data_Out)

);


initial begin

Data_In= 128'h876E46A6F24CE78C4D904AD897ECC395;
#10

$finish;

end



endmodule