`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:02:41 09/06/2017
// Design Name:   PS2
// Module Name:   D:/ISE/E1339/m1/OExp13-SOC/keytst.v
// Project Name:  OExp13_SOC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PS2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module keytst;

	// Inputs
	reg clk;
	reg rst;
	reg ps2_clk;
	reg ps2_data;
	reg rdn;

	// Outputs
	wire [7:0] data;
	wire ready;
	wire [2:0] w_ptr;
	wire [2:0] r_ptr;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	PS2 uut (
		.clk(clk), 
		.rst(rst), 
		.ps2_clk(ps2_clk), 
		.ps2_data(ps2_data), 
		.rdn(rdn), 
		.data(data), 
		.ready(ready), 
		.w_ptr(w_ptr), 
		.r_ptr(r_ptr), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		ps2_clk = 0;
		ps2_data = 0;
		rdn = 1;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;
		// Add stimulus here
		#50;
		ps2_data = 1;
		#80;
		ps2_data = 0;
		#40;
		ps2_data = 1;
		#40;
		ps2_data = 0;
		#80;
		ps2_data = 1;
		#40;
		ps2_data = 0;
		#40;
		ps2_data = 1;
		#80;
		#20;
		rdn = 0;
		#10;
		rdn = 1;
	end
    always begin
		clk = 1; #5;clk = 0; #5;
	end
	always begin
		ps2_clk = 1; #20; ps2_clk = 0;#20;
	end
endmodule

