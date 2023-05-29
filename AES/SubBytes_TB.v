module SubBytes_TB();
reg  [0:127] Input;
wire [0:127] Output;

initial begin
//Input = 128'hccaa12a5d8e1ffc1114599bbbdcdeeda;

//#100

Input = 128'h3243f6a8885a308d313198a2e0370734;
end

SubBytes Sub1(
.Input(Input),
.Output(Output)
);
endmodule
