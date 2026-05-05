// ============================================================================
// Module Name: lab_2
// Description: A design incorporating a 4-bit up counter, a decoder, and a MUX.
//              The MUX selects between the counter output and the decoder output
//              based on the SEL signal.
// ============================================================================
module lab_2
(
    input  wire       clk,   // Master clock signal[cite: 4]
    input  wire       reset, // Active high synchronous reset[cite: 4]
    input  wire       sel,   // Controls the source of the output signal Y[cite: 4]
    output wire [3:0] y      // 4-bit output signal[cite: 4]
);

// Internal signals
reg  [3:0] Q;      // Output of the internal counter[cite: 4]
wire [3:0] Detect; // Output of the internal decoder[cite: 4]

// ----------------------------------------------------------------------------
// Free-running 4-bit Up Counter with synchronous reset[cite: 4]
// ----------------------------------------------------------------------------
always @ (posedge clk) begin
    if (reset)
        Q <= 4'b0;
    else
        Q <= Q + 1;
end

// ----------------------------------------------------------------------------
// Decoder Logic[cite: 4]
// ----------------------------------------------------------------------------
assign Detect[0] = (Q >= 4'd0)  && (Q <= 4'd3)  ? 1'b1 : 1'b0; // Detect 0-3[cite: 4]
assign Detect[1] = (Q >= 4'd4)  && (Q <= 4'd7)  ? 1'b1 : 1'b0; // Detect 4-7[cite: 4]
assign Detect[2] = (Q >= 4'd8)  && (Q <= 4'd11) ? 1'b1 : 1'b0; // Detect 8-11[cite: 4]
assign Detect[3] = (Q >= 4'd12) && (Q <= 4'd15) ? 1'b1 : 1'b0; // Detect 12-15[cite: 4]

// ----------------------------------------------------------------------------
// MUX Logic[cite: 4]
// ----------------------------------------------------------------------------
assign y = (sel == 1'b1) ? Detect : Q; // Route Detect if sel=1, else route Q[cite: 4]

endmodule
