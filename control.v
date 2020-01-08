module control(clk,enter,sw_A,sw_B,led_out,num,seg_A,seg_B,flag);
	input clk,enter;
	input [4:0]sw_A;
	input [4:0]sw_B;
	output reg [9:0]led_out;
	output reg [3:0]seg_A=3;
	output reg [3:0]seg_B=3;
	output reg [3:0]num=1;
	output reg [31:0]flag;
	integer count=0;
	integer now=0;
	integer i;
	integer pos;
	reg [9:0]ans;
	always@(posedge clk) begin
		case(num)
		1:
			begin
			num<=3;
			count<=count+num;
			end
		2:
			begin
			num<=5;
			count<=count+num;
			end
		3:
			begin
			num<=7;
			count<=count+num;
			end
		4:
			begin
			num<=2;
			count<=count+num;
			end
		5:
			begin
			num<=6;
			count<=count+num;
			end
		6:
			begin
			num<=9;
			count<=count+num;
			end
		7:
			begin
			num<=4;
			count<=count+num;
			end
		8:
			begin
			num<=1;
			count<=count+num;
			end
		9:
			begin
			num<=8;
			count<=count+num;
			end
		default:
			begin
			num<=3;
			count<=count+num;
			end
		endcase
		if(count>10)
			begin
				integer put;
				put<=count%10;
				count<=count-10;
				pos<=now;
				for(pos=now;pos<10;pos=pos+1)
					begin
					ans[pos]<=1'b1;
					end
				
				i<=0;
				for(i=0;i<put;i=i+1)
					begin
					ans[i]<=1'b1;
					now<=i+1;
					end
				if((ans[9:5]==sw_A[4:0])&&(ans[4:0]==sw_B[4:0]))//correct
					begin
					flag<=32'b11000010101000111010001110100001;
					end
				else
					begin
					flag<=32'b11000111110000001001001010000110;
					end
				i<=0;
				for(i=0;i<10;i=i+1)
					begin
					ans[i]<=1'b0;
					end
			end
		if(count<=10)
			begin
				pos<=now;
				for(pos=now;pos<count;pos=pos+1)
					begin
					ans[pos]<=1'b1;
					now<=pos+1;
					end
				if((ans[9:5]==sw_A[4:0])&&(ans[4:0]==sw_B[4:0]))//correct
					begin
					flag<=32'b11000010101000111010001110100001;
					end
				else
					begin
					flag<=32'b11000111110000001001001010000110;
					end
					i<=0;
				for(i=0;i<10;i=i+1)
					begin
					ans[i]<=1'b0;
					end
			end
		end
endmodule 