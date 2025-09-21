`timescale 1ns/1ps
module tb_relu;

    reg  signed [15:0] x;
    wire signed [15:0] y;

    relu uut (.x(x), .y(y));

    initial begin
        x = -5; #10;
        x =  0; #10;
        x =  7; #10;
        $finish;
    end

    initial begin
        $dumpfile("relu.vcd");
        $dumpvars(0, tb_relu);
    end

endmodule
