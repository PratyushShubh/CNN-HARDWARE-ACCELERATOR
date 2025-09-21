module cnn_top(input clk, input rst, input [7:0] pixel_in, output [7:0] result);

    wire [7:0] conv_out;
    wire [7:0] relu_out;
    wire [7:0] pool_out;
    wire [7:0] fc_out;

    conv_layer u1 (.clk(clk), .rst(rst), .pixel_in(pixel_in), .pixel_out(conv_out));
    relu_layer u2 (.data_in(conv_out), .data_out(relu_out));
    pool_layer u3 (.clk(clk), .rst(rst), .data_in(relu_out), .data_out(pool_out));
    fc_layer   u4 (.clk(clk), .rst(rst), .data_in(pool_out), .data_out(fc_out));

    assign result = fc_out;
endmodule
