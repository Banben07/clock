module top(input                  CLOCK_50,
			  input			[3:0]		 KEY,
			  input			[17:0]	 SW,
			  output       [6:0]     HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,HEX1,HEX0,
			  output	   [3:0]	 data00,data01,data10,data11,data20,data21);
wire      								  cin1,cin2,clk_n;
wire							[5:0]		  second1,minute1;
wire							[4:0]		  hour1;
time_1 clock(.CLOCK_50(CLOCK_50),.RST(KEY[3]),.clk_n(clk_n));
number_1 second(.clk(clk_n),.SW(SW),.rst(KEY[3]),.number(second1),.cin(cin1));
number_1 minute(.clk(cin1),.SW(SW),.rst(KEY[3]),.number(minute1),.cin(cin2));
number_2	hour(.clk(cin2),.SW(SW),.rst(KEY[3]),.number(hour1));
trans trans_1(.number(second1),.data0(data00),.data1(data01));
trans trans_2(.number(minute1),.data0(data10),.data1(data11));	
trans trans_3(.number(hour1),.data0(data20),.data1(data21));				
HEX_MODULE HEX_MODULE_0(.display_in(data00),.ON(SW[3]),.display_out(HEX2));
HEX_MODULE HEX_MODULE_1(.display_in(data01),.ON(SW[3]),.display_out(HEX3));
HEX_MODULE HEX_MODULE_2(.display_in(data10),.ON(SW[3]),.display_out(HEX4));
HEX_MODULE HEX_MODULE_3(.display_in(data11),.ON(SW[3]),.display_out(HEX5));
HEX_MODULE HEX_MODULE_4(.display_in(data20),.ON(SW[3]),.display_out(HEX6));
HEX_MODULE HEX_MODULE_5(.display_in(data21),.ON(SW[3]),.display_out(HEX7));
HEX_MODULE HEX_MODULE_6(.display_in(data21),.ON(0),.display_out(HEX1));
HEX_MODULE HEX_MODULE_7(.display_in(data21),.ON(0),.display_out(HEX0));
endmodule
