`timescale 1 ns / 1 ps

/* ============================================================================
 * Module Name: stub
 * Description: A placeholder/dummy module used for verification in Lab 6.
 *              Instead of performing actual cryptographic calculations, this 
 *              module mimics hardware behavior by reading pre-calculated 
 *              ciphertext values line-by-line from a text file 
 *              ("test_vectors_chipher_only.txt").
 * 
 * Flow:        When the 'start' signal is asserted high, the state machine 
 *              transitions from IDLE to IS_READY. In the next clock cycle, it 
 *              reads the next hexadecimal value from the file into 'data_out' 
 *              and asserts the 'ready' signal for one clock cycle.
 *
 * Inputs:
 *   - clk      : System clock.
 *   - reset    : Synchronous active-high reset.
 *   - start    : Control signal to initiate the next file read operation.
 *   - data_in  : 64-bit plaintext (Ignored in this stub module).
 *   - key      : 64-bit encryption key (Ignored in this stub module).
 *
 * Outputs:
 *   - data_out : 64-bit ciphertext loaded directly from the text file.
 *   - ready    : Status flag indicating valid data is present on 'data_out'.
 * ============================================================================ */

module stub
(
	input clk ,
	input reset ,
	input start ,
	input [63:0] data_in ,
	input [63:0] key ,
	output reg [63:0] data_out,
	output reg ready
);

localparam IDLE = 1'b0;
localparam IS_READY = 1'b1;

integer data_file_in;
integer statusD;
reg state;

// File initialization and error checking
initial begin
	data_file_in = $fopen("test_vectors_chipher_only.txt", "r");
	if (data_file_in == 0) begin
		$display("ERROR: Cannot open test_vectors_chipher_only.txt");
		$finish;
	end
end
	
// State Machine: Current State Logic
always @(posedge clk or posedge reset) begin
	if (reset)
		state <= IDLE;
	else case (state)
		IDLE: begin
			if (start == 1'b1)
				state <= IS_READY;
			else
				state <= IDLE;
		end
		IS_READY : begin
			state <= IDLE;
		end
	endcase
end
					
// State Machine: Output and File Read Logic
always @(posedge clk or posedge reset) begin
	if (reset) begin
		ready <= 1'b0;
		data_out <= 64'd0;
	end 
	else if (state == IDLE && start == 1'b1) begin
		ready <= 1'b0;
	end 
	else if (state == IS_READY) begin
		if (! $feof(data_file_in)) begin
			// Read the next hex line into data_out
			statusD = $fscanf(data_file_in,"%h\n", data_out);
			ready <= 1'b1;
		end 
		else begin
			// Graceful termination when EOF is reached
			$display("stub_file is finished");
			$fclose(data_file_in);
			ready <= 1'b0;
			$finish;
		end
	end 
	else begin
		ready <= 1'b0;
	end
end

endmodule
