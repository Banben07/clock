module number_1(
				input		          clk,
				input		          rst,
				input			[17:0] SW,
				output	     reg[5:0]  number,
				output	     reg	   cin);
		parameter   			 n=60;
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
		always@(negedge rst or posedge clk) begin
				if(!rst) begin
						cin<=0;
				end else if(number==n-1) begin
						cin<=1;
				end else
						cin<=0;
		end
endmodule