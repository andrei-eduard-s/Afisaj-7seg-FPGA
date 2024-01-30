module bin_to_bcd #(
	DIGITS = 2,
	WIDTH = $clog2(10**DIGITS - 1)
) (
	input[WIDTH-1:0] bin_i,
	output reg [DIGITS-1:0][3:0] bcd_o
);


always @ (*) begin
	integer i;
	reg [WIDTH - 1:0] tmp;
	tmp = bin_i;
	for (i=0; i<DIGITS; i=i+1) begin
		bcd_o[i] = tmp % 10;
		tmp = tmp / 10;
	end
end

endmodule