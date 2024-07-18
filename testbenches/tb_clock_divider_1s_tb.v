`timescale 1ns/1ps // Define timescale

module tb_clock_divider_1s_tb;

    // Declare signals
    reg clk;
    wire pulse;
    wire [40:0] counter;

    // Instantiate the module
    clock_divider_1s dut (
        .clk(clk),
        .pulse(pulse),
        .counter(counter)
    );

    // Clock generation process
    always #5 clk = ~clk; // Toggle the clock every 5 ns for 100 MHz clock

    // Initial block
    initial begin
        clk = 0; // Initialize clk to 0
        #10; // Wait for some time for initial signals to settle

        // Display initial values
        $display("Time = %0t, clk = %b, pulse = %b, count = %d", $time, clk, pulse, counter);

       
    end

endmodule

