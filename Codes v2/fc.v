// Fully Connected Layer: y = sum(x[i]*w[i]) + bias
module fc #(parameter WIDTH=8, N=4)(
    input  wire clk,
    input  wire rst,
    input  wire en,
    input  wire signed [N*WIDTH-1:0] in_vec,   // flattened
    input  wire signed [N*WIDTH-1:0] weights,  // flattened
    input  wire signed [WIDTH-1:0] bias,
    output reg  signed [2*WIDTH+3:0] out
);

    integer i;
    reg signed [2*WIDTH-1:0] acc;
    reg signed [WIDTH-1:0] in_i, w_i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= 0;
        end else if (en) begin
            acc = 0;
            for (i = 0; i < N; i = i+1) begin
                in_i = in_vec[i*WIDTH +: WIDTH];
                w_i  = weights[i*WIDTH +: WIDTH];
                acc  = acc + in_i * w_i;
            end
            out <= acc + bias;
        end
    end

endmodule
