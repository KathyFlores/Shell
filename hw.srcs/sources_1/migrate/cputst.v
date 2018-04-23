`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:51:18 09/05/2017
// Design Name:   MCPU
// Module Name:   D:/ISE/E1339/m1/OExp13-SOC/cputst.v
// Project Name:  OExp13_SOC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cputst;

	// Inputs
	reg clk;
	reg reset;
	reg INT;
	reg MIO_ready;
	reg [31:0] Data_in;

	// Outputs
	wire [31:0] PC_out;
	wire [31:0] inst_out;
	wire mem_w;
	wire [31:0] Addr_out;
	wire [31:0] Data_out;
	wire CPU_MIO;
	wire [4:0] state;

	// Instantiate the Unit Under Test (UUT)
	MCPU uut (
		.clk(clk), 
		.reset(reset), 
		.INT(INT), 
		.MIO_ready(MIO_ready), 
		.PC_out(PC_out), 
		.inst_out(inst_out), 
		.mem_w(mem_w), 
		.Addr_out(Addr_out), 
		.Data_out(Data_out), 
		.Data_in(Data_in), 
		.CPU_MIO(CPU_MIO), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		INT = 0;
		MIO_ready = 1;
		Data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        reset=0;
	
		// Add stimulus here
		Data_in=32'b001111_00000_00001_0000111100001111;#60;
		Data_in=32'b001101_00001_00010_1101010101010101;#80;
	end
    always begin
	clk=1;#10;clk=0;#10;
	end
endmodule

