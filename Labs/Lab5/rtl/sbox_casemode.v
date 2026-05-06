// Lab 5: DES S-Box Implementation using Combinational Logic (Case Statement)
`default_nettype none

module SBOX_ROM_B_casemode (
    input  wire [3:0] adrs,
    output reg  [3:0] data
);

    // 16x4 ROM mapped via combinational logic (LUTs)
    always @(*) begin
        case (adrs)
            4'd0:  data = 4'hc;
            4'd1:  data = 4'h5;
            4'd2:  data = 4'h6;
            4'd3:  data = 4'hb;
            4'd4:  data = 4'h9;
            4'd5:  data = 4'h0;
            4'd6:  data = 4'ha;
            4'd7:  data = 4'hd;
            4'd8:  data = 4'h3;
            4'd9:  data = 4'he;
            4'd10: data = 4'hf;
            4'd11: data = 4'h8;
            4'd12: data = 4'h4;
            4'd13: data = 4'h7;
            4'd14: data = 4'h1;
            4'd15: data = 4'h2;
            default: data = 4'h0; // Prevents unwanted latch inference
        endcase
    end

endmodule
