----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:43 11/23/2015 
-- Design Name: 
-- Module Name:    ImmTrans - Behavioral 
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

entity ImmTrans is
    Port ( ImmTrans_Imm_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           ImmTrans_SignExt : in STD_LOGIC;
           ImmTrans_Width : in STD_LOGIC_VECTOR(1 downto 0);
           ImmTrans_Imm_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end ImmTrans;

architecture Behavioral of ImmTrans is

begin

process(ImmTrans_Imm_IN, ImmTrans_SignExt, ImmTrans_Width)
begin
    if (ImmTrans_SignExt = '1') then
        case ImmTrans_Width is
            when "00" =>
                if (ImmTrans_Imm_IN(3) = '1') then
                    ImmTrans_Imm_OUT(15 downto 3) <= "1111111111111";
                else
                    ImmTrans_Imm_OUT(15 downto 3) <= "0000000000000";
                end if;
                ImmTrans_Imm_OUT(2 downto 0) <= ImmTrans_Imm_IN(2 downto 0);
            when "01" =>
                if (ImmTrans_Imm_IN(4) = '1') then
                    ImmTrans_Imm_OUT(15 downto 4) <= "111111111111";
                else
                    ImmTrans_Imm_OUT(15 downto 4) <= "000000000000";
                end if;
                ImmTrans_Imm_OUT(3 downto 0) <= ImmTrans_Imm_IN(3 downto 0);
            when "10" =>
                if (ImmTrans_Imm_IN(7) = '1') then
                    ImmTrans_Imm_OUT(15 downto 7) <= "111111111";
                else
                    ImmTrans_Imm_OUT(15 downto 7) <= "000000000";
                end if;
                ImmTrans_Imm_OUT(6 downto 0) <= ImmTrans_Imm_IN(6 downto 0);
            when "11" =>
                if (ImmTrans_Imm_IN(10) = '1') then
                    ImmTrans_Imm_OUT(15 downto 10) <= "111111";
                else
                    ImmTrans_Imm_OUT(15 downto 10) <= "000000";
                end if;
                ImmTrans_Imm_OUT(9 downto 0) <= ImmTrans_Imm_IN(9 downto 0);
        
            when others =>
                ImmTrans_Imm_OUT <= ImmTrans_Imm_IN;
        end case;
    else
        if (ImmTrans_Width = "01") then
            if (ImmTrans_Imm_IN = "0000000000000000") then
                ImmTrans_Imm_OUT <= "0000000000001000";
            else
                ImmTrans_Imm_OUT <= ImmTrans_Imm_IN;    
            end if;
        else
            ImmTrans_Imm_OUT <= ImmTrans_Imm_IN;    
        end if;
    end if;
end process;

end Behavioral;

