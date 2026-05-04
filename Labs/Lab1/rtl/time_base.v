// ============================================================================
// Module Name: time_base
// Description: Hard Coded Time Base Generator. 
//              Generates a single Terminal Count (TC) pulse every 100 
//              clock cycles[cite: 1]. Used to enable other synchronous mechanisms.
// ============================================================================
module time_base
(
    input  wire clk,   // System clock input[cite: 1]
    input  wire reset, // Active-high synchronous reset[cite: 1]
    output wire tc     // Terminal Count output pulse[cite: 1]
);

// Internal 7-bit register to hold the counter value (capable of counting to 127)[cite: 2]
reg [6:0] q;

// Synchronous sequential logic block
always @ (posedge clk)
    if (reset)
        q <= 7'b0; // Reset the counter to 0 synchronously[cite: 2]
    else if (q < 7'd100)
        q <= q + 1; // Increment counter as long as it is less than 100[cite: 2]
    else
        q <= 7'b0; // Reset counter back to 0 after reaching the target[cite: 2]

// Combinational logic for the output:
// tc is asserted (High) only when the counter reaches exactly 100[cite: 2]
assign tc = (q == 7'd100) ? 1'b1 : 1'b0;

endmodule
