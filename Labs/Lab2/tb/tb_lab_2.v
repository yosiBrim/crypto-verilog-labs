`timescale 1ns/1ps

// ============================================================================
// Module Name: tb_lab_2
// Description: Testbench verifying the counter, decoder, and MUX functionality.
//              Uses XMR to monitor internal signals Q and Detect[cite: 4].
// ============================================================================
module tb_lab_2 ();

reg tb_clk, tb_reset, tb_sel;
wire [3:0] tb_y;

// ----------------------------------------------------------------------------
// Signal Monitoring (Using XMR)[cite: 4]
// ----------------------------------------------------------------------------
initial begin
    $display ("time\t\tclk\treset\tsel\tq\tdetect\ty");
    $monitor ("%g\t\t%b\t%b\t%b\t%d\t%b\t\t%d", 
              $time, tb_clk, tb_reset, tb_sel, DUT.Q, DUT.Detect, tb_y); // Monitoring internal signals via XMR
end

// ----------------------------------------------------------------------------
// ATP (Acceptance Test Plan) Stimulus
// ----------------------------------------------------------------------------
initial begin
    tb_clk   = 1;
    tb_reset = 1; 
    tb_sel   = 0; 
    
    #100 tb_reset = 0; // Release reset to sync
    #260 tb_sel   = 1; // Switch selection to test both states without completing a full cycle
end

always begin
    #5 tb_clk = ~tb_clk; // 10ns period clock
end

// DUT Instantiation
lab_2 DUT
(
    .clk   (tb_clk),
    .reset (tb_reset),
    .sel   (tb_sel),
    .y     (tb_y)
);

endmodule
