`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:50:48 03/28/2017
// Design Name:
// Module Name:    ALU_v
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
module alu(input [31:0]A, B,
			input[3:0]ALU_operation,
			output reg [31:0] res,
			output zero,
			output reg overflow);
	wire [31:0] res_addu,res_subu,res_sra,res_sll,res_sltu,res_and,res_or,res_add,res_sub,res_nor,res_slt,res_srl,res_xor;
	wire o0, o1, o2, o3;
	parameter one = 32'h00000001, zero_0 = 32'h00000000;
	assign res_and= A&B;
	assign res_or= A|B;
	assign res_nor=~(A|B);
	assign {o0,res_add}=(ALU_operation==0010)? ($signed(A)+$signed(B)):{1'b0,{$signed(A)+$signed(B)}};
	assign {o1,res_sub}=(ALU_operation==0110)? ($signed(A)-$signed(B)):{1'b0,{$signed(A)-$signed(B)}};
	assign {o2,res_addu}=(ALU_operation==1011)? ($unsigned(A)+$unsigned(B)):{1'b0,{$unsigned(A)+$unsigned(B)}};
    assign {o3,res_subu}=(ALU_operation==1100)? ($unsigned(A)-$unsigned(B)):{1'b0,{$unsigned(A)-$unsigned(B)}};
	assign res_srl=A>>B[10:6];
	assign res_xor=A^B;
	assign res_slt=($signed(A) < $signed(B)) ? one : zero_0;
    assign res_sltu=(A<B)?one:zero_0;
    assign res_sll=A<<B[10:6];
    assign res_sra=A>>>B[10:6];
	always@ * begin
		case (ALU_operation)
			4'b0000: res=res_and;
			4'b0001: res=res_or;
			4'b0010: begin res=res_add; overflow=o0; end
			4'b0110: begin res=res_sub; overflow=o1; end
			4'b1011: begin res=res_addu;overflow=o2; end
			4'b1100: begin res=res_subu;overflow=o3; end
			4'b0100: res=res_nor;
			4'b0111: res=res_slt;
			4'b1000: res=res_sltu;
			4'b0101: res=res_srl;
			4'b0011: res=res_xor;
			4'b1001: res=res_sll;
			4'b1010: res=res_sra;
			default: res=32'hx;
		endcase
	end
	assign zero = (res==32'b0)? 1'b1: 1'b0;
endmodule
