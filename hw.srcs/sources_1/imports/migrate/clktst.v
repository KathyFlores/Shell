`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:07:48 09/05/2017
// Design Name:   clk_div
// Module Name:   D:/ISE/E1339/m1/OExp13-SOC/clktst.v
// Project Name:  OExp13_SOC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clktst;

	// Inputs
	reg clk;
	reg rst;
	reg SW2;

	// Outputs
	wire [31:0] clkdiv;
	wire Clk_CPU;
	wire clk_100mhz;

	// Instantiate the Unit Under Test (UUT)
	clk_div uut (
		.clk(clk), 
		.rst(rst), 
		.SW2(SW2), 
		.clkdiv(clkdiv), 
		.Clk_CPU(Clk_CPU), 
		.clk_100mhz(clk_100mhz)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		SW2 = 0;
		// Wait 100 ns for global reset to finish
		#100;
        rst=0;
		// Add stimulus here

	end
      always begin 
	  clk=1;#2.5;
	  clk=0;#2.5;
	  end
endmodule

