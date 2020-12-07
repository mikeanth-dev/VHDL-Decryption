`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:08 11/23/2020 
// Design Name: 
// Module Name:    ceasar_decryption 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Revision 0.02 - Doc Comments Added
// Revision 0.03 - Implement busy port, fix typo in module name
// Revision 0.04 - General Logic Exmplained in top comment
// Revision 0.05 - First attempt at an implementation
// Revision 0.06 - Rephrase explanation to be more verbose
// Revision 0.07 - Add comments throughout the code
//////////////////////////////////////////////////////////////////////////////////
module caesar_decryption #(
				parameter D_WIDTH = 8,
				parameter KEY_WIDTH = 16
			)(
			// Clock and reset interface
			input clk,		// system clock
			input rst_n,	// negated reset
			
			// Input interface
			input[D_WIDTH - 1:0] data_i, // The encrypted message
			input valid_i, // Data in enable
			
			// Decryption Key
			input[KEY_WIDTH - 1 : 0] key, // The number of characters to shift
			
			// Output interface
			output reg busy,
			output reg[D_WIDTH - 1:0] data_o, // The decrypted message
			output reg valid_o // Data out Enable
	);
	/////////////////////////// LOGIC OVERVIEW ///////////////////////////
	//	Everything happens on the positive edge of the [clk] signal		//
	//																	//
	//	if [rst_n] is HIGH:												//
	//		if [valid_i] is HIGH										//
	//			set [valid_o] to HIGH						 			//
	//			set [data_o] to [data_i] - [key]						//
	//		else														//
	//			set [valid_o] to LOW									//
	//			set [data_o] to 0										//
	//	else															//
	//		set all outs to 0											//
	//////////////////////////////////////////////////////////////////////

	always @(posedge clk) begin
		// busy should always be 0, as per the documentation
		busy <= 0;
		
		// if !reset is high -> reset is low
		if (rst_n) begin
			// set [valid_o] to high if [valid_i] was high last clock
			valid_o <= valid_i;

			// if [valid_i] was high last clock, decrypt input message and
			// send it to [data_o]
			data_o <= (valid_i) ? data_i - key : 0;

			// DEBUG
			//if (valid_o)
			//	$display("| key\t| in\t| out\t|\n|0x%0h\t| 0x%0h\t| 0x%0h\t|", key, data_i, data_o);
		end 
		
		// if reset is high, set [valid_o] to low. [data_o] CAN be ignored
		else begin
			valid_o <= 0;
			data_o <= 0;
		end
	end
endmodule
