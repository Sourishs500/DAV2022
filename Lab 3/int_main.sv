module int_main(input clock,	output reg [7:0] dig0,
	output reg [7:0] dig1,
	output reg [7:0] dig2,
	output reg [7:0] dig3,
	output reg [7:0] dig4,
	output reg [7:0] dig5,
	input reset, input pause, input switch);

	reg clockOut;
	reg clockOut2;
	reg [63:0] displayedValue;
	reg [63:0] storedValue;
	reg [63:0] counter;
	reg [2:0] state;
	
	parameter S0 = 2'b00; // reset
	parameter S1 = 2'b01; // paused
	parameter S2 = 2'b10; // running
	
	
	always @ (posedge clock) begin
	    
		 if (!reset)
			state <= S0;
		 
		 else if (!pause && state == S1) 
			state <= S2;
			
		 else if(!pause)
			state <= S1;
	end
	
		 
	/* always@(*) begin
		case (state)
			S0: begin
				counter <= 0;
				displayedValue <= counter;
				end
			S1: begin 
				storedValue <= counter;
				displayedValue <= storedValue;
				end
			S2: begin
				displayedValue <= counter;
				end
			default: 
				displayedValue <= counter;
		endcase
	end */
			


clk_div100 clock1(clock, switch, clockOut);
clk_div200 clock2(clock, switch, clockOut2);

reg oredClocks;

	always@(*) begin
		oredClocks <= clockOut | clockOut2;
	end


	always@(posedge oredClocks) begin
		case (state)
			S0: begin
				counter <= 0;
				displayedValue <= counter;
				end
			S1: begin 
				storedValue <= counter;
				displayedValue <= storedValue;
				end
			S2: begin
				counter <= counter + 1;
				displayedValue <= counter;
				end
			default: 
				displayedValue <= counter;
		endcase
	end

	
	
	sevenSegDisp disp(displayedValue, dig5, dig4, dig3, dig2, dig1, dig0);
	
		
	


endmodule