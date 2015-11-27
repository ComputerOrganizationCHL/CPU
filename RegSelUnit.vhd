----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:57:12 11/24/2015 
-- Design Name: 
-- Module Name:    RegSelUnit - Behavioral 
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

entity RegSelUnit is
    Port ( RegSelUnit_RsZero : in STD_LOGIC;
           RegSelUnit_RtZero : in STD_LOGIC;
           RegSelUnit_RsDedEn : in  STD_LOGIC;
           RegSelUnit_RsDedSel : in  STD_LOGIC_VECTOR (1 downto 0);
           RegSelUnit_RtDedEn : in  STD_LOGIC;
           RegSelUnit_RtDedSel : in  STD_LOGIC_VECTOR (1 downto 0);
           RegSelUnit_RsVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           RegSelUnit_RtVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           RegSelUnit_SPVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           RegSelUnit_IHVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           RegSelUnit_RAVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           RegSelUnit_TVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           RegSelUnit_RsVal_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           RegSelUnit_RtVal_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end RegSelUnit;

architecture Behavioral of RegSelUnit is

begin

process(RegSelUnit_RsDedEn, RegSelUnit_RsDedSel, RegSelUnit_RsVal_IN, 
        RegSelUnit_SPVal_IN, RegSelUnit_IHVal_IN, RegSelUnit_RAVal_IN, RegSelUnit_TVal_IN)
begin
    if (RegSelUnit_RsZero = '1') then
        RegSelUnit_RsVal_OUT <= "0000000000000000";
    else
        if (RegSelUnit_RsDedEn = '1') then
            case RegSelUnit_RsDedSel is
                when "00" =>
                    RegSelUnit_RsVal_OUT <= RegSelUnit_SPVal_IN;
                when "01" =>
                    RegSelUnit_RsVal_OUT <= RegSelUnit_IHVal_IN;
                when "10" =>
                    RegSelUnit_RsVal_OUT <= RegSelUnit_RAVal_IN;
                when "11" =>
                    RegSelUnit_RsVal_OUT <= RegSelUnit_TVal_IN;
                when others =>
                    RegSelUnit_RsVal_OUT <= RegSelUnit_RsVal_IN;
            end case;
        else 
            RegSelUnit_RsVal_OUT <= RegSelUnit_RsVal_IN;
        end if;
    end if;
end process;

process(RegSelUnit_RtDedEn, RegSelUnit_RtDedSel, RegSelUnit_RtVal_IN, 
        RegSelUnit_SPVal_IN, RegSelUnit_IHVal_IN, RegSelUnit_RAVal_IN, RegSelUnit_TVal_IN)
begin
    if (RegSelUnit_RtZero = '1') then
        RegSelUnit_RtVal_OUT <= "0000000000000000";
    else
        if (RegSelUnit_RtDedEn = '1') then
            case RegSelUnit_RtDedSel is
                when "00" =>
                    RegSelUnit_RtVal_OUT <= RegSelUnit_SPVal_IN;
                when "01" =>
                    RegSelUnit_RtVal_OUT <= RegSelUnit_IHVal_IN;
                when "10" =>
                    RegSelUnit_RtVal_OUT <= RegSelUnit_RAVal_IN;
                when "11" =>
                    RegSelUnit_RtVal_OUT <= RegSelUnit_TVal_IN;
                when others =>
                    RegSelUnit_RtVal_OUT <= RegSelUnit_RtVal_IN;
            end case;
        else 
            RegSelUnit_RtVal_OUT <= RegSelUnit_RtVal_IN;
        end if;
    end if;
end process;

end Behavioral;

