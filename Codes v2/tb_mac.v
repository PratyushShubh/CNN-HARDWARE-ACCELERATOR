`timescale 1ns/1ps
module tb_mac;

    reg clk, rst, en;
    reg signed [7:0] a, b;
    wire signed [15:0] y;

    mac uut (.clk(clk), .rst(rst), .en(en), .a(a), .b(b), .y(y));

    // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1; en = 0;
        a = 0; b = 0;

        #12 rst = 0; en = 1;

        a = 2; b = 3; #10;   // expect 6
        a = 1; b = 4; #10;   // expect 10
        a = -1; b = 5; #10;  // expect 5

        $finish;
    end

    initial begin
        $dumpfile("mac.vcd");
        $dumpvars(0, tb_mac);
    end

endmodule
