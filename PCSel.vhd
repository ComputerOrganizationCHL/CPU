----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:47 11/23/2015 
-- Design Name: 
-- Module Name:    PCSel - Behavioral 
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

entity PCSel is
    Port ( PC_CLK : in STD_LOGIC;
           PC_En : in  STD_LOGIC;
           PC_Reset : in  STD_LOGIC;
           PC_Sel : in STD_LOGIC;
           PC_Int : in STD_LOGIC;
           PC_JmpPC_IN : in STD_LOGIC_VECTOR(15 downto 0);
           PC_NextPC_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_NextPC_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           PC_PC : out STD_LOGIC_VECTOR(15 downto 0));
end PCSel;

architecture Behavioral of PCSel is

    signal PC : STD_LOGIC_VECTOR(15 downto 0);

begin

PC_PC <= PC;

process(PC_CLK)
begin
    if (rising_edge(PC_CLK)) then
        if (PC_Reset = '1') then
            if (PC_En = '1') then
                if (PC_Sel = '1') then
                    PC <= PC_JmpPC_IN;
                    
                    PC_NextPC_OUT <= PC_JmpPC_IN;
                else
                    PC <= PC_NextPC_IN;
                
                    PC_NextPC_OUT <= PC_NextPC_IN;
                end if;
            else
                if (PC_Int = '1') then
                    PC_NextPC_OUT <= PC;
                else
                    PC <= "0000000000000100";
                    
                    PC_NextPC_OUT <= "0000000000000100";
                end if;
            end if;
        else 
            PC <= "0000000000000000";
            
            PC_NextPC_OUT <= "0000000000000000";
        end if;
    end if;
end process;

end Behavioral;

