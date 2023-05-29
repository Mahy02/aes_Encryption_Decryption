module SubBytes_DEC_TB();
reg  [0:127] Input_DEC;
wire [0:127] Output_DEC;

initial begin
Input_DEC = 128'h637c777bf26b6fc53001672bfed7ab76;
#10
Input_DEC = 128'he1f8981169d98e9441992d0fb054bb16;
#10
$finish;
end

SubBytes_DEC Sub1_DEC(
.Input_DEC(Input_DEC),
.Output_DEC(Output_DEC)
);
endmodule
