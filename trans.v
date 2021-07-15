module trans(input       [5:0]      number,
				 output		 [3:0]		data0,data1);
				 assign		    		   data0=number % 4'd10;
				 assign					   data1=number / 4'd10 % 4'd10;
endmodule
