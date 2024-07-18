`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module clock_divider_1s(
    input wire clk,
    output reg pulse, reg [40:0] counter
	 );
	reg [40:0] count;
	
    initial begin
        count <= 0;
		  pulse = 1'b1; // Set pulse initially to high
    end
 
    always @(posedge clk) begin
        if (count == 99999999) begin   
				pulse <= ~pulse;
				count <= 0;
		
        end
		  else begin
				count <= count + 2;
		  end
    end
	 
	 always @(*) begin
	 counter<=count;
	 end

endmodule
