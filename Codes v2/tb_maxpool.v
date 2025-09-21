`timescale 1ns/1ps
module tb_maxpool;

    reg  signed [7:0] a, b, c, d;
    wire signed [7:0] y;

    maxpool uut (.a(a), .b(b), .c(c), .d(d), .y(y));

    initial begin
        a=1; b=3; c=2; d=0; #10;   // expect 3
        a=-1; b=-2; c=-3; d=-4; #10; // expect -1
        a=7; b=5; c=9; d=2; #10;   // expect 9
        $finish;
    end

    initial begin
        $dumpfile("maxpool.vcd");
        $dumpvars(0, tb_maxpool);
    end

endmodule
