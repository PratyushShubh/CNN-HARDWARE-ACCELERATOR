// Rectified Linear Unit
module relu #(parameter WIDTH=16)(
    input  wire signed [WIDTH-1:0] x,
    output reg  signed [WIDTH-1:0] y
);

    always @(*) begin
        if (x < 0)
            y = 0;
        else
            y = x;
    end

endmodule
