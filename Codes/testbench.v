`timescale 1ns/1ps

module testbench;
    reg clk, rst;
    reg [7:0] pixel_in;
    wire [7:0] result;

    cnn_top DUT(.clk(clk), .rst(rst), .pixel_in(pixel_in), .result(result));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("cnn.vcd");
        $dumpvars(0, testbench);

        clk = 0; rst = 1; pixel_in = 0;
        #10 rst = 0;

        pixel_in = 8'd5; #10;
        pixel_in = 8'd7; #10;
        pixel_in = 8'd10; #10;

        #50 $finish;
    end
endmodule
