module single_digit_7seg_driver #(
		DISPLAY_TYPE = 0 //Implicit (0) = Catod comun
) (
	input			[3:0] bcd_i,
	output reg  [7:0] seg7_o,
	input					blank_i,
	output				blank_o
);


always @ (*) begin
	case (bcd_i)
		0: seg7_o = 8'b00111111;
		1: seg7_o = 8'b00000110;
		2: seg7_o = 8'b01011011;
		3: seg7_o = 8'b01001111;
		4: seg7_o = 8'b01100110;
		5: seg7_o = 8'b01101101;
		6: seg7_o = 8'b01111101;
		7: seg7_o = 8'b00000111;
		8: seg7_o = 8'b01111111;
		9: seg7_o = 8'b01101111;
		default: seg7_o = 8'hxx;
	endcase
	seg7_o = {8{!blank_o}} & seg7_o;
	
	if (DISPLAY_TYPE)
		seg7_o = ~seg7_o;
end

assign blank_o = !(|bcd_i) && blank_i;

endmodule