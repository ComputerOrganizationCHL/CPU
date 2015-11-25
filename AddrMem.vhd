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
    Port ( AddrMem_CLK_low : in STD_LOGIC;
           AddrMem_CLK_high : in STD_LOGIC;
           AddrMem_Reset : in  STD_LOGIC;
           AddrMem_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_RE : in STD_LOGIC;
           AddrMem_WE : in STD_LOGIC;
           AddrMem_EN : in STD_LOGIC;
           AddrMem_Ins_IN : in STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_Ins_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_Ram1_Addr : out STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_Ram1_Data : inout STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_Ram1_OE : out STD_LOGIC;
           AddrMem_Ram1_WE : out STD_LOGIC;
           AddrMem_Ram1_EN : out STD_LOGIC );
end AddrMem;

architecture Behavioral of AddrMem is
	
	type status is (readPre,readIns,readWait,writePre,writeIns,writeWait,Asleep);
	signal current_status : status := Asleep;
	signal next_status : status := Asleep;

begin

process( AddrMem_CLK_high,AddrMem_Reset,AddrMem_EN)
begin
	if AddrMem_Reset = '0' or AddrMem_EN = '0' then
		current_status <= Asleep;
	elsif rising_edge( AddrMem_CLK_high) and AddrMem_EN = '1' then
		current_status <= next_status;
	end if;
end process;

process(current_status,AddrMem_EN)
begin	
	case current_status is
		when Asleep =>
			if AddrMem_RE = '1' and AddrMem_WE = '0' and AddrMem_EN = '1' then
				next_status <= readPre;
			elsif AddrMem_RE = '0' and AddrMem_WE = '1' and AddrMem_EN = '1' then
				next_status <= writePre;
				else
					next_status <= Asleep;
			end if;
		when readPre =>
			next_status <= readIns;
		when readIns =>
			next_status <= readWait;
		when readWait =>
			next_status <= Asleep;
		when writePre =>
			next_status <= writeIns;
		when writeIns =>
			next_status <= writeWait;
		when writeWait =>
			next_status <= Asleep;
		when others =>
			next_status <= Asleep;
	end case;
end process;

process(AddrMem_CLK_high)
begin
	case next_status is
		when readPre =>
			AddrMem_Ram1_Addr <= AddrMem_PC;
			AddrMem_Ram1_Data <= "ZZZZZZZZZZZZZZZZ";
			AddrMem_Ram1_EN <= '0';
			AddrMem_Ram1_OE <= '0';
			AddrMem_Ram1_WE <= '1';
		when readIns =>
			AddrMem_Ins_OUT <= AddrMem_Ram1_Data;
		when readWait =>
			AddrMem_Ram1_EN <= '1';
			AddrMem_Ram1_OE <= '1';
			AddrMem_Ram1_WE <= '1';
		when writePre =>
			AddrMem_Ram1_Addr <= AddrMem_PC;
			AddrMem_Ram1_Data <= AddrMem_Ins_IN;
			AddrMem_Ram1_EN <= '0';
			AddrMem_Ram1_OE <= '1';
			AddrMem_Ram1_WE <= '1';
		when writeIns =>
			AddrMem_Ram1_EN <= '0';
			AddrMem_Ram1_OE <= '1';
			AddrMem_Ram1_WE <= '0';
		when writeWait =>
			AddrMem_Ram1_EN <= '1';
			AddrMem_Ram1_OE <= '1';
			AddrMem_Ram1_WE <= '1';
		when Asleep =>
	end case;
end process;

end Behavioral;

