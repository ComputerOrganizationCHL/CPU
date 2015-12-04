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


RegSelUnit_RsVal_OUT <= "0000000000000000"  when RegSelUnit_RsZero = '1'    else
                        RegSelUnit_RsVal_IN when RegSelUnit_RsDedEn = '0'   else
                        RegSelUnit_SPVal_IN when RegSelUnit_RsDedSel = "00" else
                        RegSelUnit_IHVal_IN when RegSelUnit_RsDedSel = "01" else
                        RegSelUnit_RAVal_IN when RegSelUnit_RsDedSel = "10" else
                        RegSelUnit_TVal_IN  when RegSelUnit_RsDedSel = "11";
                        

RegSelUnit_RtVal_OUT <= "0000000000000000"  when RegSelUnit_RtZero = '1'    else
                        RegSelUnit_RtVal_IN when RegSelUnit_RtDedEn = '0'   else
                        RegSelUnit_SPVal_IN when RegSelUnit_RtDedSel = "00" else
                        RegSelUnit_IHVal_IN when RegSelUnit_RtDedSel = "01" else
                        RegSelUnit_RAVal_IN when RegSelUnit_RtDedSel = "10" else
                        RegSelUnit_TVal_IN  when RegSelUnit_RtDedSel = "11";

end Behavioral;

