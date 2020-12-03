`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:		A.C.S
// Engineer:	Anton Mircea-Pavel
// 
// Create Date:		23:12:00 11/23/2020 
// Design Name:
// Module Name:		Register Bank
// Project Name:	Tema2_Decryption
// Target Devices:	N/A
// Tool versions:	N/A
// Description:		This block is responsible for handling the input data from the outside.
//					It stores the keys for the cyphers and sends the select signals to the
//					*MUX blocks
//
// Dependencies:	N/A
//
// Revision:
// Revision 0.01 - File Created
// Revision 0.02 - Doc Comments Added
// Revision 0.03 - General Logic Explained in Comments
//////////////////////////////////////////////////////////////////////////////////

module decryption_regfile #(
			parameter addr_witdth	= 8,
			parameter reg_width		= 16
		)(
			// Clock and reset interface
			input clk,		// system clock
			input rst_n,	// reset signal
			
			// Register access interface
			input[addr_witdth - 1:0]		addr, // the address of the desired register
			input							read, // basically a read_enable signal
			input							write, // basically a write_enable signal
			input [reg_width -1 : 0]		wdata, // the written data
			output reg [reg_width -1 : 0]	rdata, // the read data
			output reg						done, // 'bool' value to indicate status
			output reg						error, // 'bool' value to indicate errors
			
			// Output wires
			output reg[reg_width - 1 : 0] select,	// The signal that will be 
													//sent to the MUX & DEMUX blocks
			output reg[reg_width - 1 : 0] caesar_key,
			output reg[reg_width - 1 : 0] scytale_key,
			output reg[reg_width - 1 : 0] zigzag_key
	);
	/////////////////////////// LOGIC OVERVIEW ///////////////////////////
	//	Everything happens on the positive edge of the [clk] signal		//
	//																	//
	//	if [addr] is valid:												//
	//		if [read] is HIGH:											//
	//			set [rdata] to the contents of the block at [addr]		//
	//			set [done] to HIGH										//
	//		if [write] is HIGH:											//
	//			set the contents of the block at [add] to [wdata]		//
	//			set [done] to HIGH on the next clock					//
	//		set [error] to LOW											//
	//	else															//
	//		set [error] to HIGH											//
	//		set [done] to HIGH											//
	//////////////////////////////////////////////////////////////////////
	
	
endmodule
