`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module top_level_module(
	input clk,
	output wire clock_1s,
	output wire [7:0] seg_display,
	output reg [7:0] leds,
	output reg [3:0] anode
);

	
   reg [1:0] state, next_state;
	
	wire [3:0] mynum;
	wire [3:0] counter; // Declaration for the counter signal
	
	// Define states
    parameter S1 = 2'b00, S2 = 2'b01, S3 = 2'b10, S4 = 2'b11;
	 
	 
	 //state register
	 initial begin
			state <= S1;
			next_state <= S1;
			leds <= 0;
			anode <= 0;
	 end

	 	 
	 always @(posedge clk) begin
        state <= next_state;
    end
	 
	 always @ (*) begin
		case (state)
			S1: begin
					anode <= 4'b0111;
					leds <= {2'b11, 2'b10, 2'b10, 2'b10};
            end
			S2: begin
				 anode <= 4'b1011;
				  leds <= {2'b10, 2'b11, 2'b10, 2'b10};
			end
			S3: begin
				 anode <= 4'b1101;
				  leds <= {2'b10, 2'b10, 2'b11, 2'b10};
			end
			S4: begin
				 anode <= 4'b1110;
				 leds <= {2'b10, 2'b10, 2'b10, 2'b11};
			end
		endcase
	 end
	 
	 always @(posedge clock_1s) begin
	 
		  next_state <= state;
		  
        // State transition logic
        case (state)
            S1: begin
                if (mynum != 0) begin
						next_state <= S1;
							
                end else begin
						next_state <= S2;
					 end
            end
            S2: begin
                if (mynum != 0) begin
                    //leds <= {2'b10, 2'b11, 2'b10, 2'b10};
                    next_state <= S2;
                end else begin
                    //leds <= {2'b10, 2'b10, 2'b11, 2'b10};
                    next_state <= S3;
						  //anode <= 4'b1101;
                end
            end
            S3: begin
                //anode <= 4'b1101;
                if (mynum != 0) begin
                    //leds <= {2'b10, 2'b10, 2'b11, 2'b10};
                    next_state <= S3;
                end else begin
                    //leds <= {2'b10, 2'b10, 2'b10, 2'b11};
                    next_state <= S4;
						  //anode <= 4'b1110;
                end
            end
            S4: begin
                //anode <= 4'b1110;
                if (mynum != 0) begin
                    //leds <= {2'b10, 2'b10, 2'b10, 2'b11};
                    next_state <= S4;
                end else begin
                    //leds <= {2'b11, 2'b10, 2'b10, 2'b10};
                    next_state <= S1;
						  //anode <= 4'b0111;
                end
            end
        endcase
    end 

// Instantiate the clock_divider_1s module  which will run always
    clock_divider_1s Clk_divider_inst (
        .clk(clk),
        .pulse(clock_1s)
    );
	 
	 // Instantiate the decrementer module
    decrementer Decrementer_inst (
        .clk(clock_1s),  // Connect the clock signal
        .counter(mynum) // Connect the counter signal
    ); 
	 
	 // Instantiate seven_seg_module
    seven_seg_module Seven_seg_inst (
        .num(mynum),       // Connecting pulse to num of seven_seg_module
		  .clk(clock_1s),
        .seg(seg_display)  // Output of seven_seg_module connected to seg_display
    );
	 
	 
	
	 
endmodule
