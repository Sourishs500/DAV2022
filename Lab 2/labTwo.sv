module labTwo(switches, leds, dig5, dig4, dig3, dig2, dig1, dig0);
	//since this is the top level, it should include all of your IO as ports
	//Inputs: switches
	//Outputs: leds, 6 seven segment signals (dig5, dig4, dig3, dig2, dig1, dig0) that are 8 bits each
	//Other reg/wires:
	 reg [3:0] input5, input4, input3, input2, input1, input0; //These are inputs for your six seven-seg displays 
	 reg [19:0] decimalValue;
	 
	 // assign decimalValue = {10'b0000000000, switches};

	/*
	----------PART ONE----------
	Assign your LED pin outs based on your switch inputs. 
	This should be very simple (assign statements) and can go directly in the top level
	----------PART ONE----------
	*/
	input [9:0] switches;
	output [9:0] leds;
	
	assign leds = switches;
	

	/*
	----------PART TWO----------
	First, fill out the code for the sevenSegDigit module.

	Instantiate 6 copies of sevenSegDigit, using the dig5, dig4, etc as inputs like so:
	sevenSegDigit digit5(input5, dig5); //Instantiation of the leftmost seven-seg display. Note that dig5 should be connected to the pins corresponding to the leftmost display

	In an always_comb block, you can set inputs to these digits to numbers you want to check!

	After finishing part two, comment out these 6 instantiations and the logic to set the inputs so that it does not interfere with part three
	----------PART TWO----------
	*/
	
	output reg [7:0] dig0;
	output reg [7:0] dig1;
	output reg [7:0] dig2;
	output reg [7:0] dig3;
	output reg [7:0] dig4;
	output reg [7:0] dig5;
	
	/*
	assign input5 = 4'b1000;
	assign input4 = 4'b0100;
	assign input3 = 4'b0010;
	assign input2 = 4'b0110;
	assign input1 = 4'b0011;
	assign input0 = 4'b0001;
	
	
	sevenSegDigit digit0 (input0, dig0);
	sevenSegDigit digit1 (input1, dig1);
	sevenSegDigit digit2 (input2, dig2);
	sevenSegDigit digit3 (input3, dig3);
	sevenSegDigit digit4 (input4, dig4);
	sevenSegDigit digit5 (input5, dig5); */ 
	

	

	

	/*
	----------PART FOUR----------
	First, fill out the code for the sevenSegDisp module.
	Instantiate the sevenSegDisp module using decimalValue as the input, and connecting the outputs to the six 8-bit seven segment display signal pins in your top level
	Instantiate miniALU with the appropriate signals from the switch inputs as inputs (based on the spec) and decimalValue as the output.
	----------PART FOUR----------
	*/
	


	/*
	----------PART FIVE----------
	We've used 8 of the switches for inputs A and B that are four bits each. One switch is the operation.
	Now, the last switch will act as an enable for the display. If the last switch is high, the display should work as intended.
	If the last switch is low, the display should be blank regardless of the math in part four. 
	We want to add a step between the output for sevenSegDisp and the actual output that goes to the display that sets the actual output to drive a blank display if the switch is low.
	----------PART FIVE----------
	*/

	miniALU bruh1 (switches[9:6], switches[5:2], switches[1], decimalValue);
	sevenSegDisp bruh (decimalValue, dig5, dig4, dig3, dig2, dig1, dig0, switches[0]);
	
	

	
	

endmodule
