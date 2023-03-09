module triStateBuffer(input in, input we, output out, inout SDA);
always_comb begin
	if (we) begin
		SDA = in;
		out = 1'b0;
	end else if (!we) begin
		SDA = 1'bz;
		out = SDA;
	end
end
	

endmodule