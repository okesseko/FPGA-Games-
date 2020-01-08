module outputs(led_in,seg7_A,seg7_B,seg7_num,clk,num,led,flag);
	input clk;
	input [7:0]num;
	input [7:0]seg7_A;
	input [7:0]seg7_B;
	input [9:0]led_in;
	input [31:0] flag;
	output reg [31:0] seg7_num;
	output reg [9:0]led;
	always@(posedge clk) 
	begin
		seg7_num<=flag;
		seg7_num[31:24]<=seg7_A;
		seg7_num[23:16]<=seg7_B;
		seg7_num[15:8]<=8'b11111111;
		seg7_num[7:0]<=num;
	end
endmodule
