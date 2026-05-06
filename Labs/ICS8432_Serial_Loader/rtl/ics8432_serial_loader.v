`default_nettype none

// ============================================================================
// Module Name: ics8432_serial_loader
// Description: Finite State Machine (FSM) to load a 13-bit parallel 
//              configuration word into the ICS8432-51 Frequency Synthesizer 
//              via a custom serial protocol.
// ============================================================================

module ics8432_serial_loader (
    input  wire        CLK,          // 100MHz System Clock
    input  wire        RST,          // Active-High Asynchronous Reset
    input  wire        START,        // Trigger signal (Detects 1 to 0 transition)
    input  wire [12:0] CONFIG_DATA,  // 13-bit Parallel Input (T[1:0], N[1:0], M[8:0])
    output reg         S_CLOCK,      // Serial Clock Output to ICS8432
    output reg         S_DATA,       // Serial Data Output to ICS8432
    output reg         S_LOAD,       // Latch Enable Output to ICS8432
    output wire        nP_LOAD       // Parallel Load Enable (Tied High for Serial Mode)
);

    // ------------------------------------------------------------------------
    // Static Assignments
    // ------------------------------------------------------------------------
    // According to the datasheet, nP_LOAD must be high to enable serial loading.
    assign nP_LOAD = 1'b1; 

    // ------------------------------------------------------------------------
    // FSM State Encoding
    // ------------------------------------------------------------------------
    localparam IDLE       = 2'd0; // Wait for START signal
    localparam SHIFT_LOW  = 2'd1; // S_CLOCK goes LOW, set S_DATA bit
    localparam SHIFT_HIGH = 2'd2; // S_CLOCK goes HIGH, shift register left
    localparam LATCH      = 2'd3; // Send S_LOAD pulse to latch data in the device

    reg [1:0]  state;
    reg [13:0] shift_reg; // 14-bit register: 13 Data Bits + 1 NULL Bit
    reg [3:0]  bit_count; // Counter to track 14 bits transmission

    // ------------------------------------------------------------------------
    // Synchronous Falling Edge Detector for START Signal
    // Note: The assignment forbids using 'negedge START', so we use flip-flops.
    // ------------------------------------------------------------------------
    reg start_d1;
    reg start_d2;
    wire start_falling_edge;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            start_d1 <= 1'b1; 
            start_d2 <= 1'b1;
        end else begin
            start_d1 <= START;        // Sample 1
            start_d2 <= start_d1;     // Sample 2
        end
    end

    // Detects when the older sample is 1 and the newer sample is 0
    assign start_falling_edge = (start_d2 == 1'b1 && start_d1 == 1'b0);

    // ------------------------------------------------------------------------
    // Main FSM Logic
    // ------------------------------------------------------------------------
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            // Reset all registers and outputs to default safe states
            state     <= IDLE;
            S_CLOCK   <= 1'b0;
            S_DATA    <= 1'b0;
            S_LOAD    <= 1'b0;
            shift_reg <= 14'd0;
            bit_count <= 4'd0;
        end else begin
            S_LOAD <= 1'b0; // Default value (only active during LATCH state)

            case (state)
                // Wait for the falling edge of the START button
                IDLE: begin
                    S_CLOCK <= 1'b0;
                    S_DATA  <= 1'b0;
                    
                    if (start_falling_edge) begin
                        // Assemble the 14-bit word as required by the ICS8432 protocol:
                        // { T[1:0], NULL bit (0), N[1:0], M[8:0] }
                        shift_reg <= {CONFIG_DATA[12:11], 1'b0, CONFIG_DATA[10:0]};
                        bit_count <= 4'd14; // Prepare to send 14 bits
                        state     <= SHIFT_LOW;
                    end
                end

                // Set the data line while the clock is low (Setup Time)
                SHIFT_LOW: begin
                    S_CLOCK <= 1'b0; 
                    S_DATA  <= shift_reg[13]; // Shift out the Most Significant Bit (MSB)
                    state   <= SHIFT_HIGH;
                end
