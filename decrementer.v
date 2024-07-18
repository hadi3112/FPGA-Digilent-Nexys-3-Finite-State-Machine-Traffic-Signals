`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module decrementer(
    input clk,
    output reg [3:0] counter
    );
	 
	 initial begin
	 
		counter <= 9;
		
	 end

    always @(posedge clk) begin
        if (counter == 0) begin // Check if the counter is at 0
            counter <= 9;       // Reset to 9 
		  end
        else begin
            counter <= counter - 1;
		  end
	end

endmodule
