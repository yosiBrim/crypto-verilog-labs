
`timescale 1ns/1ps // Simulation time units (1ns) and resolution (1ps)[cite: 2]

// ============================================================================
// Module Name: tb_time_base
// Description: Testbench for the Hard Coded Time Base Generator.
//              Verifies the counter logic, reset behavior, and TC pulse generation.
// ============================================================================
module tb_time_base ();

// Internal signals to drive and monitor the Device Under Test (DUT)[cite: 2]
reg tb_clk, tb_reset;
wire tb_tc;

// ----------------------------------------------------------------------------
// Signal Monitoring
// ----------------------------------------------------------------------------
initial begin
    // Prints the values of time, clock, reset, and tc whenever they change[cite: 2]
    $monitor ("%g\t\t%b\t%b\t%b", $time, tb_clk, tb_reset, tb_tc);
    $display ("time\t\tclk\treset\ttc"); // Table header
end

// ----------------------------------------------------------------------------
// Stimulus Generation (Initial block)
// ----------------------------------------------------------------------------
initial begin
    tb_clk = 1;        // Initialize clock to high[cite: 2]
    tb_reset = 1;      // Apply active-high reset initially[cite: 2]
    
    #700 tb_reset = 0; // De-assert reset after 700ns to start the counter[cite: 2]
    
    #5000 $finish;     // Terminate simulation after 5000ns[cite: 2]
end

// ----------------------------------------------------------------------------
// Clock Generation
// ----------------------------------------------------------------------------
always begin
    // Toggle clock every 50ns (Period = 100ns)[cite: 2]
    #50 tb_clk = ~tb_clk; 
end

// ----------------------------------------------------------------------------
// DUT Instantiation
// ----------------------------------------------------------------------------
time_base DUT
(
    .clk    (tb_clk),   // Connect testbench clock to DUT clock[cite: 2]
    .reset  (tb_reset), // Connect testbench reset to DUT reset[cite: 2]
    .tc     (tb_tc)     // Connect DUT tc output to testbench wire[cite: 2]
);

endmodule
