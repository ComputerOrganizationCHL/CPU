----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:29 11/23/2015 
-- Design Name: 
-- Module Name:    AddrMem - Behavioral 
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

entity AddrMem is
    Port ( AddrMem_CLK : in STD_LOGIC;
           AddrMem_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_EN : in STD_LOGIC;
           AddrMem_Ins_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           
           AddrMem_Ram2_Addr : out STD_LOGIC_VECTOR (17 downto 0);
           AddrMem_Ram2_Data : inout STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_Ram2_OE : out STD_LOGIC;
           AddrMem_Ram2_WE : out STD_LOGIC;
           AddrMem_Ram2_EN : out STD_LOGIC );
end AddrMem;

architecture Behavioral of AddrMem is
AddrMem_Ram2_Addr(17 downto 16) <= "00";

begin

process( AddrMem_CLK, AddrMem_EN, AddrMem_PC)
begin
    if AddrMem_CLK = '1' and AddrMem_EN = '1' then
        AddrMem_Ram2_Addr(15 downto 0) <= AddrMem_PC;
        AddrMem_Ram2_Data <= "ZZZZZZZZZZZZZZZZ";
        AddrMem_Ram2_EN <= '0';
        AddrMem_Ram2_OE <= '1';
        AddrMem_Ram2_WE <= '1';
    elsif AddrMem_CLK = '0' and AddrMem_EN = '1' then
        AddrMem_Ram2_EN <= '0';
        AddrMem_Ram2_OE <= '0';
        AddrMem_Ram2_WE <= '1';
    end if;
end process;

process(AddrMem_Ram2_Data, AddrMem_EN)
begin
    if NOT(AddrMem_Ram2_Data  = "ZZZZZZZZZZZZZZZZ") and AddrMem_EN = '1' then
        AddrMem_Ins_OUT <= AddrMem_Ram2_Data;
    end if;
end process;


end Behavioral;

