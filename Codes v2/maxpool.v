// 2x2 Max Pooling
module maxpool #(parameter WIDTH=8)(
    input  wire signed [WIDTH-1:0] a, b, c, d,
    output reg  signed [WIDTH-1:0] y
);

    always @(*) begin
        y = a;
        if (b > y) y = b;
        if (c > y) y = c;
        if (d > y) y = d;
    end

endmodule
