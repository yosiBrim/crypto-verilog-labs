// Lab 5 Testbench: Combinational S-Box Verification
`timescale 1 ns / 1 ps

module tb_SBOX_ROM_B_casemode();

    reg  [3:0] tb_adrs;
    wire [3:0] tb_data;

    // Device Under Test (DUT) Instantiation
    SBOX_ROM_B_casemode dut (
        .adrs(tb_adrs),
        .data(tb_data)
    );

    initial begin
        // Setup monitoring
        $display("Time\t Address\t Data_Out");
        $monitor("%4g\t %h\t\t %h", $time, tb_adrs, tb_data);
    end

    initial begin
        // Sequential stimulus generation
        tb_adrs = 4'd0;
        #100 tb_adrs = 4'd1;
        #100 tb_adrs = 4'd2;
        #100 tb_adrs = 4'd3;
        #100 tb_adrs = 4'd4;
        #100 tb_adrs = 4'd5;
        #100 tb_adrs = 4'd6;
        #100 tb_adrs = 4'd7;
        #100 tb_adrs = 4'd8;
        #100 tb_adrs = 4'd9;
        #100 tb_adrs = 4'd10;
        #100 tb_adrs = 4'd11;
        #100 tb_adrs = 4'd12;
        #100 tb_adrs = 4'd13;
        #100 tb_adrs = 4'd14;
        #100 tb_adrs = 4'd15;
        #100 $finish;
    end

endmodule
