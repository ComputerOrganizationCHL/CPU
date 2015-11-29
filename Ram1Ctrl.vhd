----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:29 11/23/2015 
-- Design Name: 
-- Module Name:    Ram1Ctrl - Behavioral 
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

entity Ram1Ctrl is
    Port ( Ram1Ctrl_CLK : in STD_LOGIC;
           Ram1Ctrl_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           Ram1Ctrl_RE : in STD_LOGIC;
           Ram1Ctrl_WE : in STD_LOGIC;
           Ram1Ctrl_EN : in STD_LOGIC;
           Ram1Ctrl_Data_IN : in STD_LOGIC_VECTOR ( 15 downto 0);
           Ram1Ctrl_Data_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           
           Ram1Ctrl_Ram1_Addr : out STD_LOGIC_VECTOR (17 downto 0);
           Ram1Ctrl_Ram1_Data : inout STD_LOGIC_VECTOR (15 downto 0);
           Ram1Ctrl_Ram1_OE : out STD_LOGIC;
           Ram1Ctrl_Ram1_WE : out STD_LOGIC;
           Ram1Ctrl_Ram1_EN : out STD_LOGIC );
end Ram1Ctrl;

architecture Behavioral of Ram1Ctrl is

begin

Ram1Ctrl_Ram1_Addr(17 downto 16) <= "00";

process(Ram1Ctrl_CLK, Ram1Ctrl_EN, Ram1Ctrl_Addr)
begin
    if Ram1Ctrl_EN = '0' then
        Ram1Ctrl_Ram1_OE <= '1';
        Ram1Ctrl_Ram1_WE <= '1';
    end if;
    
    if Ram1Ctrl_CLK = '1' and Ram1Ctrl_EN = '1' then
        if Ram1Ctrl_RE = '1' and Ram1Ctrl_WE = '0' then
            Ram1Ctrl_Ram1_Addr(15 downto 0) <= Ram1Ctrl_Addr;
            Ram1Ctrl_Ram1_Data <= "ZZZZZZZZZZZZZZZZ";
            Ram1Ctrl_Ram1_EN <= '0';
            Ram1Ctrl_Ram1_OE <= '1';
            Ram1Ctrl_Ram1_WE <= '1';
        elsif Ram1Ctrl_RE = '0' and Ram1Ctrl_WE = '1' then
            Ram1Ctrl_Ram1_Addr(15 downto 0) <= Ram1Ctrl_Addr;
            Ram1Ctrl_Ram1_Data <= Ram1Ctrl_Data_IN;
            Ram1Ctrl_Ram1_EN <= '0';
            Ram1Ctrl_Ram1_OE <= '1';
            Ram1Ctrl_Ram1_WE <= '1';
        end if;
    elsif Ram1Ctrl_CLK = '0' and Ram1Ctrl_EN = '1' then
        if Ram1Ctrl_RE = '1' and Ram1Ctrl_WE = '0' then
            Ram1Ctrl_Ram1_EN <= '0';
            Ram1Ctrl_Ram1_OE <= '0';
            Ram1Ctrl_Ram1_WE <= '1';
        elsif Ram1Ctrl_RE = '0' and Ram1Ctrl_WE = '1' then
            Ram1Ctrl_Ram1_EN <= '0';
            Ram1Ctrl_Ram1_OE <= '1';
            Ram1Ctrl_Ram1_WE <= '0';
        end if;
    end if;
end process;

process(Ram1Ctrl_Ram1_Data, Ram1Ctrl_EN)
begin
    if NOT(Ram1Ctrl_Ram1_Data  = "ZZZZZZZZZZZZZZZZ") and Ram1Ctrl_RE = '1' and Ram1Ctrl_WE = '0' and Ram1Ctrl_EN = '1' then
        Ram1Ctrl_Data_OUT <= Ram1Ctrl_Ram1_Data;
    end if;
end process;


end Behavioral;

