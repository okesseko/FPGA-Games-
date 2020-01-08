module in(sw_out_A, sw_out_B, enter, sw_in_A, sw_in_B, btn_enter, clk);
	input btn_enter, clk;
	input [9:5] sw_in_A;
	input [4:0] sw_in_B;
	output enter;
	output [9:5] sw_out_A;
	output [4:0] sw_out_B;
	
	assign sw_out_A = sw_in_A;
	assign sw_out_B = sw_in_B;
	
	button_debouncer bd_enter(clk, 1, ~btn_enter, enter);
	
endmodule
