module pool_layer(input clk, input rst, input [7:0] data_in, output reg [7:0] data_out);
    // Simple down-sampling: output every 2nd value
    reg toggle;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 0;
            toggle <= 0;
        end else begin
            toggle <= ~toggle;
            if (toggle)
                data_out <= data_in;
        end
    end
endmodule
