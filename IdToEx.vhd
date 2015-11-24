----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:33:15 11/23/2015 
-- Design Name: 
-- Module Name:    IdToEx - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IdToEx is
    Port ( CLK : in STD_LOGIC;
           IdToEx_En : in  STD_LOGIC;--En = 1是正常工作，0表示不可写并保持上次的输出
           IdToEx_Reset : in  STD_LOGIC;--Reset = 1是正常工作，0表示置0
           IdToEx_PC_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_Wr_RegMemSel_IN : in  STD_LOGIC;
           IdToEx_Wr_RegWr_IN : in  STD_LOGIC;
           IdToEx_Mem_MemRE_IN : in  STD_LOGIC;
           IdToEx_Mem_MemWE_IN : in  STD_LOGIC;
           IdToEx_ALUOp_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Imm_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RtRegImmSel_IN : in  STD_LOGIC;
           IdToEx_RtRdSel_IN : in  STD_LOGIC;
           IdToEx_RsVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RtVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_Rs_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Rt_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Rd_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_PC_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_Wr_RegMemSel_OUT : out  STD_LOGIC;
           IdToEx_Wr_RegWr_OUT : out  STD_LOGIC;
           IdToEx_Mem_MemRE_OUT : out  STD_LOGIC;
           IdToEx_Mem_MemWE_OUT : out  STD_LOGIC;
           IdToEx_ALUOp_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Imm_OUT : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RtRegImmSel_OUT : out  STD_LOGIC;
           IdToEx_RtRdSel_OUT : out  STD_LOGIC;
           IdToEx_RsVal_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RtVal_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_Rs_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Rt_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Rd_OUT : out  STD_LOGIC_VECTOR (3 downto 0));
end IdToEx;

architecture Behavioral of IdToEx is

    signal IdToEx_PC : STD_LOGIC_VECTOR(15 downto 0);
    signal IdToEx_Wr_RegMemSel : STD_LOGIC;
    signal IdToEx_Wr_RegWr : STD_LOGIC;
    signal IdToEx_Mem_MemRE : STD_LOGIC;
    signal IdToEx_Mem_MemRE : STD_LOGIC;
    signal IdToEx_ALUOp : STD_LOGIC_VECTOR(3 downto 0);
    signal IdToEx_Imm : STD_LOGIC_VECTOR(15 downto 0);
    signal IdToEx_RtRegImmSel : STD_LOGIC;
    signal IdToEx_RtRdSel : STD_LOGIC;
    signal IdToEx_RsVal : STD_LOGIC_VECTOR(15 downto 0);
    signal IdToEx_RtVal : STD_LOGIC_VECTOR(15 downto 0);
    signal IdToEx_Rs : STD_LOGIC_VECTOR(3 downto 0);
    signal IdToEx_Rt : STD_LOGIC_VECTOR(3 downto 0);
    signal IdToEx_Rd : STD_LOGIC_VECTOR(3 downto 0);
begin

process(CLK)
begin
    if (rising_edge(CLK)) then
        if (IdToEx_Reset = '1') then
            if (IdToEx_En = '1') then
                IdToEx_PC <= IdToEx_PC_IN;
                IdToEx_Wr_RegMemSel <= IdToEx_Wr_RegMemSel_IN;
                IdToEx_Wr_RegWr <= IdToEx_Wr_RegWr_IN;
                IdToEx_Mem_MemRE <= IdToEx_Mem_MemRE_IN;
                IdToEx_Mem_MemRE <= IdToEx_Mem_MemWE_IN;
                IdToEx_ALUOp <= IdToEx_ALUOp_IN;
                IdToEx_Imm <= IdToEx_Imm_IN;
                IdToEx_RtRegImmSel <= IdToEx_RtRegImmSel_IN;
                IdToEx_RtRdSel <= IdToEx_RtRdSel_IN;
                IdToEx_RsVal <= IdToEx_RsVal_IN;
                IdToEx_RtVal <= IdToEx_RtVal_IN;
                IdToEx_Rs <= IdToEx_Rs_IN;
                IdToEx_Rt <= IdToEx_Rt_IN;
                IdToEx_Rd <= IdToEx_Rd_IN;
            
                IdToEx_PC_OUT <= IdToEx_PC_IN;
                IdToEx_Wr_RegMemSel_OUT <= IdToEx_Wr_RegMemSel_IN;
                IdToEx_Wr_RegWr_OUT <= IdToEx_Wr_RegWr_IN;
                IdToEx_Mem_MemRE_OUT <= IdToEx_Mem_MemRE_IN;
                IdToEx_Mem_MemRE_OUT <= IdToEx_Mem_MemWE_IN;
                IdToEx_ALUOp_OUT <= IdToEx_ALUOp_IN;
                IdToEx_Imm_OUT <= IdToEx_Imm_IN;
                IdToEx_RtRegImmSel_OUT <= IdToEx_RtRegImmSel_IN;
                IdToEx_RtRdSel_OUT <= IdToEx_RtRdSel_IN;
                IdToEx_RsVal_OUT <= IdToEx_RsVal_IN;
                IdToEx_RtVal_OUT <= IdToEx_RtVal_IN;
                IdToEx_Rs_OUT <= IdToEx_Rs_IN;
                IdToEx_Rt_OUT <= IdToEx_Rt_IN;
                IdToEx_Rd_OUT <= IdToEx_Rd_IN;
            else
                
                IdToEx_PC_OUT <= IdToEx_PC;
                IdToEx_Wr_RegMemSel_OUT <= IdToEx_Wr_RegMemSel;
                IdToEx_Wr_RegWr_OUT <= IdToEx_Wr_RegWr;
                IdToEx_Mem_MemRE_OUT <= IdToEx_Mem_MemRE;
                IdToEx_Mem_MemRE_OUT <= IdToEx_Mem_MemWE;
                IdToEx_ALUOp_OUT <= IdToEx_ALUOp;
                IdToEx_Imm_OUT <= IdToEx_Imm;
                IdToEx_RtRegImmSel_OUT <= IdToEx_RtRegImmSel;
                IdToEx_RtRdSel_OUT <= IdToEx_RtRdSel;
                IdToEx_RsVal_OUT <= IdToEx_RsVal;
                IdToEx_RtVal_OUT <= IdToEx_RtVal;
                IdToEx_Rs_OUT <= IdToEx_Rs;
                IdToEx_Rt_OUT <= IdToEx_Rt;
                IdToEx_Rd_OUT <= IdToEx_Rd;
            end if;
        else
        
            IdToEx_PC <= "0000000000000000";
            IdToEx_Wr_RegMemSel <= '0';
            IdToEx_Wr_RegWr <= '0';
            IdToEx_Mem_MemRE <= '0';
            IdToEx_Mem_MemRE <= '0';
            IdToEx_ALUOp <= "0000";
            IdToEx_Imm <= "0000000000000000";
            IdToEx_RtRegImmSel <= '0';
            IdToEx_RtRdSel <= '0';
            IdToEx_RsVal <= "0000000000000000";
            IdToEx_RtVal <= "0000000000000000";
            IdToEx_Rs <= "0000";
            IdToEx_Rt <= "0000";
            IdToEx_Rd <= "0000";
        
            IdToEx_PC_OUT <= "0000000000000000";
            IdToEx_Wr_RegMemSel_OUT <= '0';
            IdToEx_Wr_RegWr_OUT <= '0';
            IdToEx_Mem_MemRE_OUT <= '0';
            IdToEx_Mem_MemRE_OUT <= '0';
            IdToEx_ALUOp_OUT <= "0000";
            IdToEx_Imm_OUT <= "0000000000000000";
            IdToEx_RtRegImmSel_OUT <= '0';
            IdToEx_RtRdSel_OUT <= '0';
            IdToEx_RsVal_OUT <= "0000000000000000";
            IdToEx_RtVal_OUT <= "0000000000000000";
            IdToEx_Rs_OUT <= "0000";
            IdToEx_Rt_IN <= "0000";
            IdToEx_Rd_OUT <= "0000";
        end if;
    end if;

end process;


end Behavioral;

