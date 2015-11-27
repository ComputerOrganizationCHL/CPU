----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:56:33 11/23/2015 
-- Design Name: 
-- Module Name:    IfToId - Behavioral 
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

entity IfToId is
    Port ( IfToId_CLK : in STD_LOGIC;
           IfToId_En : in  STD_LOGIC;
           IfToId_Reset : in  STD_LOGIC;
           IfToId_PC_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           IfToId_Ins_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           IfToId_PC_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           IfToId_Ins_OUT : out  STD_LOGIC_VECTOR(15 downto 0));
end IfToId;

architecture Behavioral of IfToId is
    signal PC : STD_LOGIC_VECTOR(15 downto 0);
    signal Ins : STD_LOGIC_VECTOR(15 downto 0);
    
begin

process(IfToId_CLK)
begin
    if (rising_edge(IfToId_CLK)) then
        if (IfToId_Reset = '1') then
            if (IfToId_En = '1') then
                PC <= IfToId_PC_IN;
                Ins <= IfToId_Ins_IN;
                
                IfToId_PC_OUT <= IfToId_PC_IN;
                IfToId_Ins_OUT <= IfToId_Ins_IN;
            else
                IfToId_PC_OUT <= PC;
                IfToId_Ins_OUT <= Ins;
            end if;
        else 
            PC <= "0000000000000000";
            Ins <= "0000000000000000";
            
            IfToId_PC_OUT <= "0000000000000000";
            IfToId_Ins_OUT <= "0000000000000000";
        end if;
    
    end if;

end process;

end Behavioral;

