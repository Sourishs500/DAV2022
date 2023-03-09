module nunchuk_translator (data_in, stick_x, stick_y, accel_x, accel_y, accel_z, z, c);
	START 0xf0
	
	input[7:0] data_in [5:0]; 		//6 bytes of data in
	output[7:0] stick_x, stick_y; 		// x and y axis values from the nunchuk stick
	output[9:0] accel_x, accel_y, accel_z; // x, y, z axis values from the accelerometer
	output z, c; 				//the two buttons (hint: ACTIVE LOW)
	
	assign stick_x = data_in[0];
	assign stick_y = data_in[1];
	assign accel_x = {data_in[2], data_in[5][3:2]};
	assign accel_y = {data_in[3], data_in[5][5:4]};
	assign accel_z = {data_in[4], data_in[5][7:6]};
	assign z = data_in[5][0];
	assign c = data_in[5][1];
	
	// I2C UUT(i2c_clock, reset, deviceAddr, addr, numBytes, dataIn, dataOut, write, start, done, SCLpin, SDApin);


endmodule
