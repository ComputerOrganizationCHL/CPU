----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:41:08 11/22/2015 
-- Design Name: 
-- Module Name:    MemToWr - Behavioral 
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

entity MemToWr is
    Port ( CLK : in STD_LOGIC;
           MemToWr_En : in  STD_LOGIC;
           MemToWr_RegMemSel_IN : in  STD_LOGIC;
           MemToWr_RegWr_IN : in  STD_LOGIC;
           MemToWr_MemVal_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           MemToWr_RegVal_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           MemToWr_RegOverflow_IN : in  STD_LOGIC;
           MemToWr_RegNum_IN : in  STD_LOGIC_VECTOR(2 downto 0);
           MemToWr_RegMemSel_OUT : out  STD_LOGIC;
           MemToWr_RegWr_OUT : out  STD_LOGIC;
           MemToWr_MemVal_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           MemToWr_RegVal_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           MemToWr_RegOverflow_OUT : out  STD_LOGIC;
           MemToWr_RegNum_OUT : out  STD_LOGIC_VECTOR(2 downto 0)
			  );
end MemToWr;

architecture Behavioral of MemToWr is
    signal MemToWr_RegMemSel : STD_LOGIC;
    signal MemToWr_RegWr : STD_LOGIC;
    signal MemToWr_MemVal : STD_LOGIC_VECTOR(15 downto 0);
    signal MemToWr_RegVal : STD_LOGIC_VECTOR(15 downto 0);
    signal MemToWr_RegOverflow : STD_LOGIC;
    signal MemToWr_RegNum : STD_LOGIC_VECTOR(3 downto 0);

begin

process(CLK)
begin
    if (rising_edge(CLK)) then
        if (MemToWr_Reset = '1') then
            if (MemToWr_En = '1') then
                MemToWr_RegMemSel <= MemToWr_RegMemSel_IN;
                MemToWr_RegWr <= MemToWr_RegWr_IN;
                MemToWr_MemVal <= MemToWr_MemVal_IN;
                MemToWr_RegVal <= MemToWr_RegVal_IN;
                MemToWr_RegOverflow <= MemToWr_RegOverflow_IN;
                MemToWr_RegNum <= MemToWr_RegNum_IN;
                
                MemToWr_RegMemSel_OUT <= MemToWr_RegMemSel_IN;
                MemToWr_RegWr_OUT <= MemToWr_RegWr_IN;
                MemToWr_MemVal_OUT <= MemToWr_MemVal_IN;
                MemToWr_RegVal_OUT <= MemToWr_RegVal_IN;
                MemToWr_RegOverflow_OUT <= MemToWr_RegOverflow_IN;
                MemToWr_RegNum_OUT <= MemToWr_RegNum_IN;
            else
                MemToWr_RegMemSel_OUT <= MemToWr_RegMemSel;
                MemToWr_RegWr_OUT <= MemToWr_RegWr;
                MemToWr_MemVal_OUT <= MemToWr_MemVal;
                MemToWr_RegVal_OUT <= MemToWr_RegVal;
                MemToWr_RegOverflow_OUT <= MemToWr_RegOverflow;
                MemToWr_RegNum_OUT <= MemToWr_RegNum;
            end if;
        else
        
            MemToWr_RegMemSel <= '0';
            MemToWr_RegWr <= '0';
            MemToWr_MemVal <= "0000000000000000";
            MemToWr_RegVal <= "0000000000000000";
            MemToWr_RegOverflow <= '0';
            MemToWr_RegNum <= "0000";
        
            MemToWr_RegMemSel_OUT <= '0';
            MemToWr_RegWr_OUT <= '0';
            MemToWr_MemVal_OUT <= "0000000000000000";
            MemToWr_RegVal_OUT <= "0000000000000000";
            MemToWr_RegOverflow_OUT <= '0';
            MemToWr_RegNum_OUT <= "0000";
        end if;
    end if;
end process;

end Behavioral;

