module acumulator #(
	WIDTH = 20
) (
	input 					clk_i   ,
	input 					rst_ni  ,
	input 					add_ni  ,
	input  [WIDTH-1:0] 	number_i,
	output [WIDTH-1:0] 	result_o
);

logic add_nd;

always @ (posedge clk_i or negedge rst_ni) begin
	if (!rst_ni)
		add_nd <= 1'b1;
	else
		add_nd <= add_ni;
end

always @ (posedge clk_i or negedge rst_ni) begin
	if (!rst_ni)
		result_o <= 'b0;
	else if (add_nd && !add_ni)
		result_o <= result_o + number_i;
end
		
endmodule