module int_main2(input clock,	output reg [7:0] dig0,
	output reg [7:0] dig1,
	output reg [7:0] dig2,
	output reg [7:0] dig3,
	output reg [7:0] dig4,
	output reg [7:0] dig5,
	input reset, input pause, 	
	input [0:9] switches,
	output reg buzzer);

	

	reg clockOut;
	reg clockOut1;
	reg clockOut2;
	reg [63:0] counter = 0;
	reg [2:0] state = 0;
	reg op = 0;
	
	parameter S0 = 2'b00; // SET
	parameter S1 = 2'b01; // RUN
	parameter S2 = 2'b10; // PAUSE
	parameter S3 = 2'b11; // BEEP
	
	
	always @ (posedge clock) begin
	    case (state) 
			S0: begin
				if (!pause) state <= S1;
				end	
			S1: begin
					if (counter == 0) state <= S3;
					else if (!reset) state <= S0;
					else if (!pause) state <= S2;
				end
			S2: begin
					if (!reset) state <= S0;
					else if (!pause) state <= S1;
				end
			S3: begin
					if (!reset) state <= S0;
				 end
		 
		 endcase
	end
	
	
			


clk_div100 clock1(clock, 1, clockOut);
clk_div1000 clock2(clock, 0, clockOut1);
clk_divSec clock3(clock, clockOut2);



	always@(posedge clockOut) begin
		case (state)
			S0: begin
					counter <= switches * 7'd100;
					op <= 0;
				end
			S1: begin 
					counter <= counter - 1;
					op <= 0;
				end
			S2: begin
					op <= 0;
				end
			S3: begin
					op <= clockOut2;
				end
			default: begin op <= 0; end


		endcase
	end

	always@(posedge clock) begin
		if (state == S3) begin
			buzzer <= clockOut1;
		end
		else
			buzzer <= 0;
	end
	
	sevenSegDisp disp(counter, dig5, dig4, dig3, dig2, dig1, dig0, op);
	
		
	


endmodule