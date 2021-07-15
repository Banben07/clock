module number_2(
				input		          clk,
				input		          rst,
				input			[17:0] SW,
				output	reg[4:0]  number);
		parameter   			 n=24;
		always@(posedge clk or negedge rst) begin
				if(!rst) begin
						number<=0;
				end else if(SW[0]) begin
						number<=number;
				end else if(number==n-1) begin
						number<=0;
				end else begin
						number<=number+1;
				end
		end
endmodule	