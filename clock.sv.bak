module clk_div100(input clock, input switch, output reg newClock);
	reg [18:0] counter = 0;
	
	always@(posedge clock) begin
		counter <= counter + 1;
		
		if (counter > 19'd500000)
			counter <= 0;
	end
	
	
	always_comb begin
		if(counter == 19'd500000 && switch == 1)
			newClock = 1;
		else 
			newClock = 0;
		end
			


endmodule

module clk_div1000(input clock, input switch, output reg newClock);
	reg [17:0] counter = 0;
	
	always@(posedge clock) begin
		counter <= counter + 1;
		
		if (counter > 18'd11904)
			counter <= 0;
	end
	
	
	always_comb begin
		if(counter >= 18'd5952 && switch == 0)
			newClock = 1;
		else 
			newClock = 0;
		end
			


endmodule

module clk_divSec(input clock, output reg newClock);
	reg [25:0] counter = 0;
	
	always@(posedge clock) begin
		counter <= counter + 1;
		
		if (counter > 26'd50000000)
			counter <= 0;
	end
	
	always_comb begin
		if(counter >= 26'd25000000)
			newClock = 1;
		else 
			newClock = 0;
		end
endmodule