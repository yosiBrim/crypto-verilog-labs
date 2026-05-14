// Module: DES Stub Interface
// Description: Emulates the DES core by reading pre-calculated ciphertext from a file.

module stub (
    input  wire        clk,
    input  wire        start,
    output reg  [63:0] data_out,
    output reg         ready
);

    integer file_handle;
    reg [63:0] cipher_mem [0:9];
    integer i = 0;

    initial begin
        // Relative path ensures portability
        file_handle = $fopen("../test_vectors/expected_output.txt", "r");
        if (file_handle == 0) begin
            $display("Error: Could not open ciphertext file.");
            $finish;
        end
        
        for (i = 0; i < 10; i = i + 1) begin
            $fscanf(file_handle, "%h\n", cipher_mem[i]);
        end
        $fclose(file_handle);
        i = 0;
        ready = 1'b0;
    end

    always @(posedge clk) begin
        if (start) begin
            ready <= 1'b0; // Reset ready for 1 cycle
            data_out <= cipher_mem[i];
            i <= i + 1;
        end else begin
            ready <= 1'b1;
        end

        if (i == 10) begin
            $display("Stub: All 10 vectors processed.");
            $display("stub file is finished"); // Fix: Separated display from finish
            $finish;
        end
    end

endmodule
