`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:45 11/22/2015 
// Design Name: 
// Module Name:    ExToMem 
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
module ExToMem(
    input ExToMem_En,
    input ExToMem_PC_IN,
    input ExToMem_MemToWr_RegMemSel_IN,
    input ExToMem_MemToWr_RegWr_IN,
    input ExToMem_MemEn_IN,
    input ExToMem_MemVal_IN,
    input ExToMem_MemAddr_IN,
    input ExToMem_RegOverflow_IN,
    input ExToMem_RegNum_IN,
    output ExToMem_PC_OUT,
    output ExToMem_MemToWr_RegMemSel_OUT,
    output ExToMem_MemToWr_RegWr_OUT,
    output ExToMem_MemEn_OUT,
    output ExToMem_MemVal_OUT,
    output ExToMem_MemAddr_OUT,
    output ExToMem_RegOverflow_OUT,
    output ExToMem_RegNum_OUT
    );


endmodule
