module fc_layer(input clk, input rst, input [7:0] data_in, output reg [7:0] data_out);
    reg [7:0] weight = 8'd3;
    always @(posedge clk or posedge rst) begin
        if (rst)
            data_out <= 0;
        else
            data_out <= data_in * weight;
    end
endmodule
