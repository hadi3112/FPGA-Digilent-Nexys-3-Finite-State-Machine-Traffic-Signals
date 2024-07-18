`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
module seven_seg_module(
    input [3:0] num,
    input clk,
    output reg [7:0] seg
);

    reg [2:0] was_nine;

    always @ (posedge clk) begin
        case (num)
        4'b0000: seg = 7'b1000000;  // 7-segment pattern for '0'
        4'b0001: seg = 7'b1111001;  // 7-segment pattern for '1'
        
		  4'b0010: seg = 7'b0100100;   // 7-segment pattern for '2'
        4'b0011: seg = 7'b0110000;  // 7-segment pattern for '3'
		  
        4'b0100: seg = 7'b0011001;  // 7-segment pattern for '4'
		  
        4'b0101: seg = 7'b0010010;  // 7-segment pattern for '5'
		  
        4'b0110: seg = 7'b0000010;  // 7-segment pattern for '6'
        4'b0111: seg = 7'b1111000;  // 7-segment pattern for '7'
        
		  4'b1000: seg = 7'b0000000;  // 7-segment pattern for '8'
        4'b1001: seg = 7'b0010000;  // 7-segment pattern for '9'
		  
		  default: seg = 7'b0000000;  // Default case for an unknown input, displaying blank
        
    endcase
        
        /*if (num == 9) begin
				#100;
            was_nine <= was_nine + 1;
        end
        case (was_nine)
            3'b001: seg = 7'b1111000;
            3'b010: seg = 7'b0110000;
            
        endcase*/
    end

    initial begin
        was_nine <= 3'b000;
    end

endmodule

