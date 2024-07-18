`timescale 1ns / 1ps

module tb_decrementer;

	// Inputs
	reg clk;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	decrementer uut (
		.clk(clk), 
		.counter(counter)
	);
	
	// Clock generation for simulation
    always #1 clk = ~clk; // Toggle the clock every 5 time units

	initial begin
		// Initialize Inputs
		clk = 0; 

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

