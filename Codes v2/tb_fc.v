`timescale 1ns/1ps
module tb_fc;

    reg clk, rst, en;
    reg  signed [31:0] in_vec;     // 4 x 8-bit = 32 bits
    reg  signed [31:0] weights;    // 4 x 8-bit = 32 bits
    reg  signed [7:0]  bias;
    wire signed [19:0] out;

    fc uut (.clk(clk), .rst(rst), .en(en),
            .in_vec(in_vec), .weights(weights), .bias(bias), .out(out));

    always #5 clk = ~clk;

    initial begin
        clk=0;
        rst=1; en=0;

        // Pack inputs: {in3, in2, in1, in0}
        in_vec   = {8'd4, 8'd3, 8'd2, 8'd1};
        weights  = {8'd2, -8'd1, 8'd0, 8'd1};
        bias     = 1;

        #12 rst=0; en=1;
        #20 $finish;
    end

    initial begin
        $dumpfile("fc.vcd");
        $dumpvars(0, tb_fc);
    end

endmodule
