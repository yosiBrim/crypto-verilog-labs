// Testbench: Automated DES Verification
// Methodology: File-based comparison (Self-checking)

`timescale 1ns/1ps

module tb_test_vectors();
    reg clk;
    reg start;
    wire [63:0] data_out;
    wire ready;
    
    reg [63:0] expected_data [0:9];
    integer ref_file;
    integer v_idx;

    // Instantiate Stub
    stub DUT (
        .clk(clk),
        .start(start),
        .data_out(data_out),
        .ready(ready)
    );

    // Clock Generation
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        // Load expected results for comparison
        ref_file = $fopen("../test_vectors/expected_output.txt", "r");
        for (v_idx = 0; v_idx < 10; v_idx = v_idx + 1) begin
            $fscanf(ref_file, "%h\n", expected_data[v_idx]);
        end
        $fclose(ref_file);

        v_idx = 0;
        start = 0;
        #100;

        // Verification Loop
        repeat(10) begin
            wait(ready);
            start = 1;
            #20;
            start = 0;
            #20;
            
            if (data_out === expected_data[v_idx]) begin
                $display("Time: %t | Vector %d: PASS (Out: %h)", $time, v_idx, data_out);
            end else begin
                $display("Time: %t | Vector %d: FAIL (Out: %h, Expected: %h)", $time, v_idx, data_out, expected_data[v_idx]);
            end
            v_idx = v_idx + 1;
        end
    end
endmodule
