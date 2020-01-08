module change(num,seg7_A,seg7_B,seg7);
input [3:0]num;
input [3:0]seg7_A;
input [3:0]seg7_B;
output [31:0]seg7;
reg [3:0]put=10;
initial 
begin
	Seg7Decode s0(n0, seg7[31:24]);
	Seg7Decode s1(n1, seg7[23:16]);
	Seg7Decode s2(put, seg7[15:8]);
	Seg7Decode s3(n3, seg7[7:0]);
end
endmodule
