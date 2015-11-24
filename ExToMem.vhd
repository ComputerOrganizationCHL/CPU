----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:07:37 11/22/2015 
-- Design Name: 
-- Module Name:    ExToMem - Behavioral 
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


entity ExToMem is
    Port ( CLK : in STD_LOGIC;
           ExToMem_En : in  STD_LOGIC;--En = 1是正常工作，0表示不可写并保持上次的输出
           ExToMem_Reset : in  STD_LOGIC;--Reset = 1是正常工作，0表示置0
           ExToMem_PC_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_Wr_RegMemSel_IN : in  STD_LOGIC;
           ExToMem_Wr_RegWr_IN : in  STD_LOGIC;
           ExToMem_Mem_MemRE_IN : in  STD_LOGIC;
           ExToMem_Mem_MemWE_IN : in  STD_LOGIC;
           ExToMem_MemVal_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_MemAddr_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_RegOverflow_IN : in  STD_LOGIC;
           ExToMem_RegNum_IN : in  STD_LOGIC_VECTOR(3 downto 0);
           ExToMem_PC_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_Wr_RegMemSel_OUT : out  STD_LOGIC;
           ExToMem_Wr_RegWr_OUT : out  STD_LOGIC;
           ExToMem_Mem_MemRE_OUT : out  STD_LOGIC;
           ExToMem_Mem_MemWE_OUT : out  STD_LOGIC;
           ExToMem_MemVal_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_MemAddr_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_RegOverflow_OUT : out  STD_LOGIC;
           ExToMem_RegNum_OUT : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end ExToMem;

architecture Behavioral of ExToMem is

    signal ExToMem_PC : STD_LOGIC_VECTOR(15 downto 0);
    signal ExToMem_Wr_RegMemSel : STD_LOGIC;
    signal ExToMem_Wr_RegWr : STD_LOGIC;
    signal ExToMem_Mem_MemRE : STD_LOGIC;
    signal ExToMem_Mem_MemWE : STD_LOGIC;
    signal ExToMem_MemVal : STD_LOGIC_VECTOR(15 downto 0);
    signal ExToMem_MemAddr : STD_LOGIC_VECTOR(15 downto 0);
    signal ExToMem_RegOverflow : STD_LOGIC;
    signal ExToMem_RegNum : STD_LOGIC_VECTOR(3 downto 0);

begin


process(CLK)
begin
	if (rising_edge(CLK)) then
        if (ExToMem_RESET = 1) then
            if (ExToMem_En = 1) then
                ExToMem_PC <= ExToMem_PC_IN;
                ExToMem_Wr_RegMemSel <= ExToMem_Wr_RegMemSel_IN;
                ExToMem_Wr_RegWr <= ExToMem_Wr_RegWr_IN;
                ExToMem_Mem_MemRE <= ExToMem_Mem_MemRE_IN;
                ExToMem_Mem_MemWE <= ExToMem_Mem_MemWE_IN;
                ExToMem_MemVal <= ExToMem_MemVal_IN;
                ExToMem_MemAddr <= ExToMem_MemAddr_IN;
                ExToMem_RegOverflow <= ExToMem_RegOverflow_IN;
                ExToMem_RegNum <= ExToMem_RegNum_IN;
                
                ExToMem_PC_OUT <= ExToMem_PC_IN;
                ExToMem_Wr_RegMemSel_OUT <= ExToMem_Wr_RegMemSel_IN;
                ExToMem_Wr_RegWr_OUT <= ExToMem_Wr_RegWr_IN;
                ExToMem_Mem_MemRE_OUT <= ExToMem_Mem_MemRE_IN;
                ExToMem_Mem_MemWE_OUT <= ExToMem_Mem_MemWE_IN;
                ExToMem_MemVal_OUT <= ExToMem_MemVal_IN;
                ExToMem_MemAddr_OUT <= ExToMem_MemAddr_IN;
                ExToMem_RegOverflow_OUT <= ExToMem_RegOverflow_IN;
                ExToMem_RegNum_OUT <= ExToMem_RegNum_IN;
            else
                ExToMem_PC_OUT <= ExToMem_PC;
                ExToMem_Wr_RegMemSel_OUT <= ExToMem_Wr_RegMemSel;
                ExToMem_Wr_RegWr_OUT <= ExToMem_Wr_RegWr;
                ExToMem_Mem_MemRE_OUT <= ExToMem_Mem_MemRE;
                ExToMem_Mem_MemWE_OUT <= ExToMem_Mem_MemWE;
                ExToMem_MemVal_OUT <= ExToMem_MemVal;
                ExToMem_MemAddr_OUT <= ExToMem_MemAddr;
                ExToMem_RegOverflow_OUT <= ExToMem_RegOverflow;
                ExToMem_RegNum_OUT <= ExToMem_RegNum;
            end if;
        else 
        
            ExToMem_PC <= "0000000000000000";
            ExToMem_Wr_RegMemSel <= '0';
            ExToMem_Wr_RegWr <= '0';
            ExToMem_Mem_MemRE <= '0';
            ExToMem_Mem_MemWE <= '0';
            ExToMem_MemVal <= '0';
            ExToMem_MemAddr <= "0000000000000000";
            ExToMem_RegOverflow <= "0000000000000000";
            ExToMem_RegNum <= "0000";
        
            ExToMem_PC_OUT <= "0000000000000000";
            ExToMem_Wr_RegMemSel_OUT <= '0';
            ExToMem_Wr_RegWr_OUT <= '0';
            ExToMem_Mem_MemRE_OUT <= '0';
            ExToMem_Mem_MemWE_OUT <= '0';
            ExToMem_MemVal_OUT <= '0';
            ExToMem_MemAddr_OUT <= "0000000000000000";
            ExToMem_RegOverflow_OUT <= "0000000000000000";
            ExToMem_RegNum_OUT <= "0000";
        end if;
    end if;
end process;


end Behavioral;

