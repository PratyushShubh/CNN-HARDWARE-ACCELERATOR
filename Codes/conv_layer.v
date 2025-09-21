module conv_layer(input clk, input rst, input [7:0] pixel_in, output reg [7:0] pixel_out);
    reg [7:0] kernel = 8'd2;  // fixed weight for simplicity

    always @(posedge clk or posedge rst) begin
        if (rst)
            pixel_out <= 0;
        else
            pixel_out <= pixel_in * kernel;
    end
endmodule
