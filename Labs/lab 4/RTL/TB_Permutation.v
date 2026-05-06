// Lab 4 Testbench: Verification of IP and Inverse IP
`timescale 1ns / 1ps

module TB_Permutation();
    reg  [63:0] Data_In;
    wire [63:0] Y_Perm;
    wire [63:0] Y_Final;

    // Instance 1: Initial Permutation
    Permutation DUT1 (
        .Data_In(Data_In),
        .Y(Y_Perm)
    );

    // Instance 2: Inverse Initial Permutation (Input is output of IP)
    Inverse_Permutation DUT2 (
        .Data_In(Y_Perm),
        .Y(Y_Final)
    );

    initial begin
        // Monitor signals in the console
        $display("Time\t\t Input\t\t\t Final Output\t\t Status");
        $monitor("%0t\t %h\t %h\t %s", $time, Data_In, Y_Final, (Data_In == Y_Final) ? "PASS" : "FAIL");

        // Test Case 1: Standard Hex Pattern
        Data_In = 64'h0123456789ABCDEF;
        #50;

        // Test Case 2: All F's and zeros
        Data_In = 64'hFFFFFFFF00000000;
        #50;

        // Test Case 3: Alternating bits
        Data_In = 64'hAAAA5555AAAA5555;
        #50;

        $finish;
    end
endmodule
