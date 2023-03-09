module clkDiv(input clock, output reg newClock);
	reg [18:0] counter = 0;
	parameter SPEED = 100;
	localparam divNum = 50000000 / SPEED;
	
	always@(posedge clock) begin
		counter <= counter + 1;
		
		if (counter >= divNum)
			counter <= 0;
	end
	
	
	always_comb begin
		if(counter >= divNum / 2)
			newClock = 1;
		else 
			newClock = 0;
		end
			


endmodule