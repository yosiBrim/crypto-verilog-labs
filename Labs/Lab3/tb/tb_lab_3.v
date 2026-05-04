// ============================================================================
// Module Name: tb_lab_3
// Description: Testbench to verify the functionality of the lab_3 coffee 
//              machine FSM. It simulates the clock, reset, and coin insertions.
// ============================================================================
module tb_lab_3
(
);

// Internal signals for driving the Design Under Test (DUT)
reg tb_clk, tb_reset, tb_coin;
wire tb_coffee;

// ----------------------------------------------------------------------------
// Clock Generation
// ----------------------------------------------------------------------------
initial
    tb_clk = 1'b1;

// Toggle clock every 5 time units (10 time units period -> 100MHz frequency)
always
    #5 tb_clk = ~tb_clk;

// ----------------------------------------------------------------------------
// Reset Generation
// ----------------------------------------------------------------------------
initial
begin
    tb_reset = 1'b1;     // Apply reset initially
    #117;                // Wait for 117 time units
    tb_reset = 1'b0;     // Release reset
end

// ----------------------------------------------------------------------------
// Stimulus Generation (Injecting coins)
// ----------------------------------------------------------------------------
initial begin
    tb_coin = 1'b0;
    
    // First coin
    #317 tb_coin = 1'b1;
    #10  tb_coin = 1'b0;
    
    // Second coin
    #300 tb_coin = 1'b1;
    #10  tb_coin = 1'b0;
    
    // Third coin
    #300 tb_coin = 1'b1;
    #10  tb_coin = 1'b0;
    
    // Fourth coin
    #300 tb_coin = 1'b1;
    #10  tb_coin = 1'b0;
    
    // Fifth coin (Coffee should be dispensed here)
    #300 tb_coin = 1'b1;
    #10  tb_coin = 1'b0;
end

// ----------------------------------------------------------------------------
// DUT Instantiation
// ----------------------------------------------------------------------------
lab_3 DUT
(
    .clk    (tb_clk    ),
    .reset  (tb_reset  ),
    .coin   (tb_coin   ),
    .coffee (tb_coffee )
);

endmodule
