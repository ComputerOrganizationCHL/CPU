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
    Port ( ExToMem_CLK : in STD_LOGIC;
           ExToMem_En : in  STD_LOGIC;
           ExToMem_Reset : in  STD_LOGIC;
           
           ExToMem_PC_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           ExToMem_RegMemSel_IN : in STD_LOGIC;
           ExToMem_RegWr_IN : in STD_LOGIC;
           ExToMem_MemRE_IN : in STD_LOGIC;
           ExToMem_MemWE_IN : in STD_LOGIC;
           ExToMem_MemVal_IN : in  STD_LOGIC_VECTOR(15 downto 0);--From RsVal Or RtVal
           ExToMem_MemAddr_IN : in  STD_LOGIC_VECTOR(15 downto 0);--ALU's OUT
           ExToMem_RegNum_IN : in  STD_LOGIC_VECTOR(3 downto 0);
           
           ExToMem_PC_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           ExToMem_RegMemSel_OUT : out STD_LOGIC;
           ExToMem_RegWr_OUT : out STD_LOGIC;
           ExToMem_MemRE_OUT : out STD_LOGIC;
           ExToMem_MemWE_OUT : out STD_LOGIC;
           ExToMem_MemVal_OUT : out  STD_LOGIC_VECTOR(15 downto 0);--From RsVal Or RtVal
           ExToMem_MemAddr_OUT : out  STD_LOGIC_VECTOR(15 downto 0);--ALU's OUT
           ExToMem_RegNum_OUT : out  STD_LOGIC_VECTOR(3 downto 0));
           
end ExToMem;

architecture Behavioral of ExToMem is
    signal PC : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal RegMemSel : STD_LOGIC    := '0';
    signal RegWr : STD_LOGIC    := '0';
    signal MemRE : STD_LOGIC    := '0';
    signal MemWE : STD_LOGIC    := '0';
    signal MemVal : STD_LOGIC_VECTOR(15 downto 0)   := (others => '0');
    signal MemAddr : STD_LOGIC_VECTOR(15 downto 0)  := (others => '0');
    signal RegNum : STD_LOGIC_VECTOR(3 downto 0)    := (others => '0');
begin

ExToMem_PC_OUT <= PC;
ExToMem_RegMemSel_OUT <= RegMemSel;
ExToMem_RegWr_OUT <= RegWr;
ExToMem_MemRE_OUT <= MemRE;
ExToMem_MemWE_OUT <= MemWE;
ExToMem_MemVal_OUT <= MemVal;
ExToMem_MemAddr_OUT <= MemAddr;
ExToMem_RegNum_OUT <= RegNum;

process(ExToMem_CLK)
begin
	if (rising_edge(ExToMem_CLK)) then
        if (ExToMem_RESET = '1') then
            if (ExToMem_En = '1') then
                PC <= ExToMem_PC_IN;
                RegMemSel <= ExToMem_RegMemSel_IN;
                RegWr <= ExToMem_RegWr_IN;
                MemRE <= ExToMem_MemRE_IN;
                MemWE <= ExToMem_MemWE_IN;
                MemVal <= ExToMem_MemVal_IN;
                MemAddr <= ExToMem_MemAddr_IN;
                RegNum <= ExToMem_RegNum_IN;
            end if;
        else 
        
            PC <= "0000000000000000";
            RegMemSel <= '0';
            RegWr <= '0';
            MemRE <= '0';
            MemWE <= '0';
            MemVal <= "0000000000000000";
            MemAddr <= "0000000000000000";
            RegNum <= "0000";
        end if;
    end if;
end process;


end Behavioral;

