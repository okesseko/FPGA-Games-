module my_pll(clk_out, clk, reset);
	input reset, clk;
	output reg clk_out;
	reg[31:0] counter;
	parameter counter_max=150000000;
	
	always@(posedge clk)begin
			if(reset)begin	
				clk_out <= 0;
				counter <= counter_max;
			end
			if(counter == 0) begin
					counter <= counter_max;
					clk_out <= ~clk_out;
			end
			else	
					counter <= counter-1;
	end
endmodule
