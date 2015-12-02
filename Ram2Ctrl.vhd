----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:29 11/23/2015 
-- Design Name: 
-- Module Name:    Ram2Ctrl - Behavioral 
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

entity Ram2Ctrl is
    Port ( Ram2Ctrl_CLK : in STD_LOGIC;
           Ram2Ctrl_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           Ram2Ctrl_RE : in STD_LOGIC;
           Ram2Ctrl_WE : in STD_LOGIC;
           Ram2Ctrl_EN : in STD_LOGIC;
           Ram2Ctrl_Data_IN : in STD_LOGIC_VECTOR ( 15 downto 0);
           Ram2Ctrl_Data_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           
           Ram2Ctrl_Ram2_Addr : out STD_LOGIC_VECTOR (17 downto 0);
           Ram2Ctrl_Ram2_Data : inout STD_LOGIC_VECTOR (15 downto 0);
           Ram2Ctrl_Ram2_OE : out STD_LOGIC;
           Ram2Ctrl_Ram2_WE : out STD_LOGIC;
           Ram2Ctrl_Ram2_EN : out STD_LOGIC );
end Ram2Ctrl;

architecture Behavioral of Ram2Ctrl is

begin

Ram2Ctrl_Ram2_Addr(17 downto 16) <= "00";

process(Ram2Ctrl_CLK, Ram2Ctrl_EN, Ram2Ctrl_Addr, Ram2Ctrl_WE, Ram2Ctrl_RE, Ram2Ctrl_Data_IN)
begin
    Ram2Ctrl_Ram2_EN <= '1';
    Ram2Ctrl_Ram2_OE <= '1';
    Ram2Ctrl_Ram2_WE <= '1';
    
    if Ram2Ctrl_CLK = '1' and Ram2Ctrl_EN = '1' then
        if Ram2Ctrl_RE = '1' and Ram2Ctrl_WE = '0' then
            Ram2Ctrl_Ram2_Addr(15 downto 0) <= Ram2Ctrl_Addr;
            Ram2Ctrl_Ram2_Data <= "ZZZZZZZZZZZZZZZZ";
            Ram2Ctrl_Ram2_EN <= '0';
        elsif Ram2Ctrl_RE = '0' and Ram2Ctrl_WE = '1' then
            Ram2Ctrl_Ram2_Addr(15 downto 0) <= Ram2Ctrl_Addr;
            Ram2Ctrl_Ram2_Data <= Ram2Ctrl_Data_IN;
            Ram2Ctrl_Ram2_EN <= '0';
        end if;
    elsif Ram2Ctrl_CLK = '0' and Ram2Ctrl_EN = '1' then
        if Ram2Ctrl_RE = '1' and Ram2Ctrl_WE = '0' then
            Ram2Ctrl_Ram2_EN <= '0';
            Ram2Ctrl_Ram2_OE <= '0';
        elsif Ram2Ctrl_RE = '0' and Ram2Ctrl_WE = '1' then
            Ram2Ctrl_Ram2_EN <= '0';
            Ram2Ctrl_Ram2_WE <= '0';
        end if;
    end if;
end process;

Ram2Ctrl_Data_OUT <= Ram2Ctrl_Ram2_Data;

end Behavioral;

