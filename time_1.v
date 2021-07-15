module time_1(
input 				   CLOCK_50,
input				      RST,
output		reg		clk_n
);
reg                [24:0] cnt;
parameter          N=25000000;
always@(posedge CLOCK_50 or negedge RST) begin
			if(!RST) begin
					cnt<=0;clk_n<=0;
			end else if(cnt==N-1) begin
					cnt<=0;clk_n=~clk_n;
			end else 
					cnt<=cnt+25'b1;
end
endmodule


