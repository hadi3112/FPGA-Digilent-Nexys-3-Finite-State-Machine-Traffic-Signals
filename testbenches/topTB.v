`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:19 11/17/2023
// Design Name:   top_level_module
// Module Name:   C:/LCS Labs/Assignment1/topTB.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module topTB;

	// Inputs
	reg clk;

	// Outputs
	wire clock_1s;
	wire [7:0] seg_display;
	wire [7:0] leds;
	wire [3:0] anode;

	// Instantiate the Unit Under Test (UUT)
	top_level_module uut (
		.clk(clk), 
		.clock_1s(clock_1s), 
		.seg_display(seg_display), 
		.leds(leds), 
		.anode(anode)
	);
	
	always #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

