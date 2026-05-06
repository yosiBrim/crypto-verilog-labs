`default_nettype none
`timescale 1ns / 1ps

// ============================================================================
// Module Name: tb_ics8432_loader
// Description: Verification environment for the ICS8432 Serial Loader.
//              Generates the 100MHz clock and simulates 5 distinct 
//              configuration sequences to verify the serial protocol.
// ============================================================================

module tb_ics8432_loader();

    // ------------------------------------------------------------------------
    // Testbench Signals
    // ------------------------------------------------------------------------
    reg         tb_CLK;
    reg         tb_RST;
    reg         tb_START;
    reg  [12:0] tb_CONFIG_DATA;
    
    wire        tb_S_CLOCK;
    wire        tb_S_DATA;
    wire        tb_S_LOAD;
    wire        tb_nP_LOAD;

    // ------------------------------------------------------------------------
    // Device Under Test (DUT) Instantiation
    // ------------------------------------------------------------------------
    ics8432_serial_loader DUT (
        .CLK(tb_CLK),
        .RST(tb_RST),
        .START(tb_START),
        .CONFIG_DATA(tb_CONFIG_DATA),
        .S_CLOCK(tb_S_CLOCK),
        .S_DATA(tb_S_DATA),
        .S_LOAD(tb_S_LOAD),
        .nP_LOAD(tb_nP_LOAD)
    );

    // ------------------------------------------------------------------------
    // Clock Generation
    // Period = 10ns -> Frequency = 100MHz (Matches Basys3 Artix-7 board)
    // ------------------------------------------------------------------------
    always #5 tb_CLK = ~tb_CLK;

    // ------------------------------------------------------------------------
    // Main Stimulus Block
    // ------------------------------------------------------------------------
    initial begin
        // 1. Initialize all inputs
        tb_CLK = 0;
        tb_RST = 1;
        tb_START = 1; // Default state of button is NOT pressed (1)
        tb_CONFIG_DATA = 13'h0000;

        // 2. Setup the monitor to print values whenever a signal changes
        $display("Time\t START\t CONFIG\t S_CLK\t S_DATA\t S_LOAD\t nP_LOAD");
        $monitor("%g\t %b\t %h\t %b\t %b\t %b\t %b", 
                 $time, tb_START, tb_CONFIG_DATA, tb_S_CLOCK, tb_S_DATA, tb_S_LOAD, tb_nP_LOAD);

        // 3. Release Reset
        #20 tb_RST = 0;
        #20;

        // --------------------------------------------------------------------
        // TEST CASE 1: All ones (Expect 14 bits of '1', with '0' at NULL position)
        // --------------------------------------------------------------------
        tb_CONFIG_DATA = 13'h1FFF; 
        tb_START = 0; // Simulate button press (Falling Edge)
        #10 tb_START = 1; // Simulate button release
        #350; // Wait sufficient time for the FSM to send all 14 bits and latch

        // --------------------------------------------------------------------
        // TEST CASE 2: Alternating pattern (Expect specific binary sequence)
        // --------------------------------------------------------------------
        tb_CONFIG_DATA = 13'h0A5A; 
        tb_START = 0; 
        #10 tb_START = 1;
        #350;

        // --------------------------------------------------------------------
        // TEST CASE 3: Alternating pattern inverted
        // --------------------------------------------------------------------
        tb_CONFIG_DATA = 13'h1555; 
        tb_START = 0; 
        #10 tb_START = 1;
        #350;

        // --------------------------------------------------------------------
        // TEST CASE 4: All zeros (Expect all '0's on the S_DATA line)
        // --------------------------------------------------------------------
        tb_CONFIG_DATA = 13'h0000; 
        tb_START = 0; 
        #10 tb_START = 1;
        #350;

        // --------------------------------------------------------------------
        // TEST CASE 5: Random mixed pattern
        // --------------------------------------------------------------------
        tb_CONFIG_DATA = 13'h0F0F; 
        tb_START = 0; 
        #10 tb_START = 1;
        #350;

        // End simulation
        #50 $finish;
    end

endmodule
