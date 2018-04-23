`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:38 02/28/2017 
// Design Name: 
// Module Name:    clk_div 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_div(input clk,
					input rst,
					input SW2,
					output reg [31:0] clkdiv,
					output Clk_CPU,
					output clk_100mhz
    );
	reg div = 0;
	always@(posedge clk or posedge rst)begin
		if(rst)
			div <= 0;
		else
			div <= div + 1;
	end
	assign clk_100mhz = div;
	always@(posedge clk_100mhz or posedge rst)begin
		if(rst)clkdiv<=0;
		else clkdiv<=clkdiv+1;
	end
	assign Clk_CPU=(SW2)?clkdiv[24]:clkdiv[1];
endmodule
