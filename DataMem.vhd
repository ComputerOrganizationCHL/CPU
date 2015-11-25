----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:41:02 11/23/2015 
-- Design Name: 
-- Module Name:    DataMem - Behavioral 
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

entity DataMem is
    Port ( DataMem_CLK_low : in STD_LOGIC;
           DataMem_CLK_high : in STD_LOGIC;
           DataMem_Reset : in  STD_LOGIC;
           DataMem_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           DataMem_RE : in  STD_LOGIC;
           DataMem_WE : in  STD_LOGIC;
           DataMem_EN : in  STD_LOGIC;
           DataMem_Val_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Val_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           
           DataMem_Ram1_Addr : out STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Ram1_Data : inout STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Ram1_OE : out STD_LOGIC;
           DataMem_Ram1_WE : out STD_LOGIC;
           DataMem_Ram1_EN : out STD_LOGIC);
end DataMem;

architecture Behavioral of DataMem is
	
	type status is (readPre,readVal,readWait,writePre,writeVal,writeWait,Asleep);
	signal current_status : status := Asleep;
	signal next_status : status := Asleep;

begin

process( DataMem_CLK_high,DataMem_Reset,DataMem_EN)
begin
	if DataMem_Reset = '0' or DataMem_EN = '0' then
		current_status <= Asleep;
	elsif rising_edge( DataMem_CLK_high) and DataMem_EN = '1' then
		current_status <= next_status;
	end if;
end process;

process(current_status,DataMem_EN)
begin	
	case current_status is
		when Asleep =>
			if DataMem_RE = '0' and DataMem_WE = '1' and DataMem_EN = '1' then
				next_status <= readPre;
			elsif DataMem_RE = '1' and DataMem_WE = '0' and DataMem_EN = '1' then
				next_status <= writePre;
				else
					next_status <= Asleep;
			end if;
		when readPre =>
			next_status <= readVal;
		when readVal =>
			next_status <= readWait;
		when readWait =>
			next_status <= Asleep;
		when writePre =>
			next_status <= writeVal;
		when writeVal =>
			next_status <= writeWait;
		when writeWait =>
			next_status <= Asleep;
		when others =>
			next_status <= Asleep;
	end case;
end process;

process(DataMem_CLK_high)
begin
	case next_status is
		when readPre =>
			DataMem_Ram1_Addr <= DataMem_Addr;
			DataMem_Ram1_Data <= "ZZZZZZZZZZZZZZZZ";
			DataMem_Ram1_EN <= '0';
			DataMem_Ram1_OE <= '0';
			DataMem_Ram1_WE <= '1';
		when readVal =>
			DataMem_Val_OUT <= DataMem_Ram1_Data;
		when readWait =>
			DataMem_Ram1_EN <= '1';
			DataMem_Ram1_OE <= '1';
			DataMem_Ram1_WE <= '1';
		when writePre =>
			DataMem_Ram1_Addr <= DataMem_Addr;
			DataMem_Ram1_Data <= DataMem_Val_IN;
			DataMem_Ram1_EN <= '0';
			DataMem_Ram1_OE <= '1';
			DataMem_Ram1_WE <= '1';
		when writeVal =>
			DataMem_Ram1_EN <= '0';
			DataMem_Ram1_OE <= '1';
			DataMem_Ram1_WE <= '0';
		when writeWait =>
			DataMem_Ram1_EN <= '1';
			DataMem_Ram1_OE <= '1';
			DataMem_Ram1_WE <= '1';
		when Asleep =>
	end case;
end process;

end Behavioral;

