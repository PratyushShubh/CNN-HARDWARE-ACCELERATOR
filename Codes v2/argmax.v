// Argmax: Finds index of maximum value in a vector
module argmax #(
    parameter N = 4,          // number of inputs
    parameter WIDTH = 16      // bitwidth of each input
)(
    input      [N*WIDTH-1:0] in_vec,   // packed input vector
    output reg [$clog2(N)-1:0] max_index  // index of max
);

    integer i;
    reg [WIDTH-1:0] current_val;
    reg [WIDTH-1:0] max_val;

    always @(*) begin
        max_val   = in_vec[WIDTH-1:0];   // first element
        max_index = 0;
        for (i = 1; i < N; i = i + 1) begin
            current_val = in_vec[i*WIDTH +: WIDTH];
            if (current_val > max_val) begin
                max_val   = current_val;
                max_index = i[$clog2(N)-1:0];
            end
        end
    end

endmodule
