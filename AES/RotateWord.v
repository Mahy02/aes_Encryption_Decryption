module RotateWord(
    output reg [0:31] rotatedword,
    input wire [0:31] word
);

    always @* begin
        rotatedword = {word[8:31], word[0:7]};
    end

endmodule