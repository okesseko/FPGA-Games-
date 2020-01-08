module outputs(led_in,seg7_A,seg7_B,seg7_num,clk,num,led);
	input clk;
	input [7:0] num;
	input [7:0]seg7_A;
	input [7:0]seg7_B;
	input [9:0]led_in;
	output reg [31:0] seg7_num;
	output reg [9:0]led;
	
	Seg7Decode bin2dec_inst(num, seg7);
	Seg7Decode bin2dec_inst2(seg7_A, seg7);
	Seg7Decode bin2dec_inst3(seg7_B, seg7);
	
	always@(num) begin
		seg7_num[7:0]<=seg7_A;
		seg7_num[15:8]<=seg7_B;
		seg7_num[31:24]<=num;
		led<=led_in;
	end
endmodule