`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     A.C.S
// Engineer:    Anton Mircea-Pavel
// 
// Create Date:     21:17:08 11/23/2020 
// Design Name: 
// Module Name:     ceasar_decryption
// Project Name:    Tema2_Decryption
// Target Devices:  N/A
// Tool versions:   14.5
// Description:     This block decrypts a caesar-encrypted message and
//                  sends it out, one character at a time
//
// Dependencies:    N/A
//
// Revision: 
// Revision 0.01 - File Created
// Revision 0.02 - Doc Comments Added
// Revision 0.03 - Implement busy port, fix typo in module name
// Revision 0.04 - General Logic Exmplained in top comment
// Revision 0.05 - First attempt at an implementation
// Revision 0.06 - Rephrase explanation to be more verbose
// Revision 0.07 - Add comments throughout the code
// Revision 0.08 - Change all tabs to spaces since Xilinx uses a 3-spaces-wide
//                 tab (WTF??) and all the code looks messy as a result of that.
// Revision 0.09 - Remove bloat comments. (check out the git log to see what i mean)
//////////////////////////////////////////////////////////////////////////////////
module caesar_decryption #(
                parameter D_WIDTH = 8,
                parameter KEY_WIDTH = 16
            )(
            // Clock and reset interface
            input clk,        // system clock
            input rst_n,    // negated reset
            
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
        end 
        
        // if reset is high, set [valid_o] to low. [data_o] CAN be ignored
        // but we won't, 'cause it's better to be safe than to be sorry :D
        if (!rst_n) begin
            valid_o <= 0;
            data_o <= 0;
        end
    end
endmodule
