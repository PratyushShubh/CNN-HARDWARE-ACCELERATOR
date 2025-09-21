module relu_layer(input signed [7:0] data_in, output [7:0] data_out);
    assign data_out = (data_in[7] == 1) ? 8'd0 : data_in;  // clamp negatives
endmodule
