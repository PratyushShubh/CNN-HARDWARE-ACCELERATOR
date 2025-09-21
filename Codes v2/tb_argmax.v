`timescale 1ns/1ps

module tb_argmax;
    parameter N = 4;
    parameter WIDTH = 16;

    reg  [N*WIDTH-1:0] in_vec;
    wire [$clog2(N)-1:0] max_index;

    // DUT
    argmax #(N, WIDTH) uut (
        .in_vec(in_vec),
        .max_index(max_index)
    );

    initial begin
        $dumpfile("argmax.vcd");
        $dumpvars(0, tb_argmax);

        // Test 1
        in_vec = {16'd10, 16'd20, 16'd5, 16'd7};  // [7, 5, 20, 10]
        #10;
        $display("Input = %h, Max index = %d", in_vec, max_index);

        // Test 2
        in_vec = {16'd1, 16'd50, 16'd25, 16'd30}; // [30, 25, 50, 1]
        #10;
        $display("Input = %h, Max index = %d", in_vec, max_index);

        // Test 3
        in_vec = {16'd100, 16'd20, 16'd80, 16'd90}; // [90, 80, 20, 100]
        #10;
        $display("Input = %h, Max index = %d", in_vec, max_index);

        $finish;
    end

endmodule
