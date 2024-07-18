`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:17:27 11/16/2023
// Design Name:   seven_seg_module
// Module Name:   C:/DSD Labs/tb_seven_seg.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_seg_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_seven_seg;

    // Declare signals for the testbench
    reg [3:0] num;    
    reg clk;          
    wire [7:0] seg;   

    // Instantiation
    seven_seg_module uut (
        .num(num),
        .seg(seg)
    );

    // Clock generation for simulation
    always #5 clk = ~clk; // Toggle the clock every 5 time units

    // Testbench initial block
    initial begin
        clk = 0; // Initialize the clock to 0
        num = 4'b0000; // Initialize num_tb to '0'

        // Apply different inputs and display corresponding outputs
        #10; // Wait for initial signals to settle

        
        repeat (10) begin
            #100; 
            num = num + 1; // Increment num to test different inputs
            
        end

    end

endmodule


