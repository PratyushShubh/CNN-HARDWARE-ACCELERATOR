// Multiply-Accumulate Unit
module mac #(parameter WIDTH=8)(
    input  wire clk,
    input  wire rst,
    input  wire en,
    input  wire signed [WIDTH-1:0] a,
    input  wire signed [WIDTH-1:0] b,
    output reg  signed [2*WIDTH-1:0] y
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            y <= 0;
        else if (en)
            y <= y + (a * b);
    end

endmodule
