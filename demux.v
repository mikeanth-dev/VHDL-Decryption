`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:		A.C.S
// Engineer:	Anton Mircea-Pavel
// 
// Create Date:		23:12:00 11/23/2020 
// Design Name:
// Module Name:		demux
// Project Name:	Tema2_Decryption
// Target Devices:	N/A
// Tool versions:	N/A
// Description:		Demux block that handles routing the encrypted input message to the correct decryptor block.
//
// Dependencies:	N/A
//
// Revision:
// Revision 0.01 - File Created
// Revision 0.02 - Doc Comments Added
//
//////////////////////////////////////////////////////////////////////////////////

module demux #(
		parameter MST_DWIDTH = 32,
		parameter SYS_DWIDTH = 8
	)(
		// Clock and reset interface
		input clk_sys,		// system clock
		input clk_mst,		// master clock (4x system clock speed)
		input rst_n,		// reset signal
		
		//Select interface
		input[1:0] select,
		
		// Input interface
		input [MST_DWIDTH -1 : 0]			data_i,		// Encrypted Message
		input								valid_i,	// Enable Signal
		
		//output interfaces
		output reg [SYS_DWIDTH - 1 : 0]		data0_o,	// Caesar Dec. Input
		output reg							valid0_o,	// Caesar Dec. Enable
		
		output reg [SYS_DWIDTH - 1 : 0]		data1_o,	// Scytale Dec. Output
		output reg							valid1_o,	// Scytale Dec. Enable
		
		output reg [SYS_DWIDTH - 1 : 0]		data2_o,	// ZigZag Dec. Output
		output reg							valid2_o	// ZigZag Dec. Enable
    );
	
	
	// TODO: Implement DEMUX logic
	

endmodule
