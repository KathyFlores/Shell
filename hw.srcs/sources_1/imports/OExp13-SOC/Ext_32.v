`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:42 02/28/2017 
// Design Name: 
// Module Name:    Ext_32 
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
module Ext_32(input s, input[15:0]imm_16,output[31:0]Imm_32
    );
	assign Imm_32=(s==1)?{imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15],imm_16[15:0]}:{16'h0,imm_16[15:0]};
//s=1:sign_ext
endmodule
