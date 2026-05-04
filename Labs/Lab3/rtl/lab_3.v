// ============================================================================
// Module Name: lab_3
// Description: Finite State Machine (FSM) for a coin-operated coffee machine.
//              The system waits for coins to be inserted and dispenses a 
//              coffee after the required number of coins are received.
// ============================================================================
module lab_3
(
    input            clk    ,  // System clock
    input            reset  ,  // Asynchronous active-high reset
    input            coin   ,  // Input signal indicating a coin was inserted
    output reg       coffee    // Output signal to dispense coffee
);

// State encoding declarations
localparam WIDTH = 3;
localparam IDLE  = 3'b000; // Initial state, waiting for the first coin
localparam COIN1 = 3'b001; // 1 coin inserted
localparam COIN2 = 3'b010; // 2 coins inserted
localparam COIN3 = 3'b011; // 3 coins inserted
localparam COIN4 = 3'b100; // 4 coins inserted
localparam COIN5 = 3'b101; // 5 coins inserted, ready to dispense or reset

// State register
reg [WIDTH - 1 : 0] state;

// FSM Sequential Logic
always @ (posedge clk)
    // Synchronous Reset: Returns FSM to IDLE and turns off coffee
    if (reset)
        begin
            state  <= IDLE;
            coffee <= 1'b0;
        end
    else
        // Next State and Output Logic
        case (state)
        IDLE : if (coin)
            begin
                state  <= COIN1; // Move to COIN1 if coin inserted
                coffee <= 1'b0;
            end
        else
            begin
                state  <= IDLE;  // Stay in IDLE if no coin
                coffee <= 1'b0;
            end
            
        COIN1 : if (coin)
            begin
                state  <= COIN2;
                coffee <= 1'b0;
            end
        else
            begin
                state  <= COIN1;
                coffee <= 1'b0;
            end
            
        COIN2 : if (coin)
            begin
                state  <= COIN3;
                coffee <= 1'b0;
            end
        else
            begin
                state  <= COIN2;
                coffee <= 1'b0;
            end
            
        COIN3 : if (coin)
            begin
                state  <= COIN4;
                coffee <= 1'b0;
            end
        else
            begin
                state  <= COIN3;
                coffee <= 1'b0;
            end
            
        COIN4 : if (coin)
            begin
                state  <= COIN5;
                coffee <= 1'b1;  // Turn ON coffee dispenser!
            end
        else
            begin
                state  <= COIN4;
                coffee <= 1'b0;
            end
            
        COIN5 : if (coin)
            begin
                state  <= COIN1; // Start a new cycle if another coin is inserted
                coffee <= 1'b0;  // Turn off coffee dispenser
            end
        else
            begin
                state  <= IDLE;  // Return to IDLE state
                coffee <= 1'b0;  // Turn off coffee dispenser
            end
        endcase
endmodule
