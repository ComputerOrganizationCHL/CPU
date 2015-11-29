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
    Port ( AddrMem_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_Data_IN : in STD_LOGIC_VECTOR ( 15 downto 0 );
           
           AddrMem_Ins_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           
           AddrMem_Ram2_Addr : out STD_LOGIC_VECTOR (15 downto 0);
           AddrMem_Ram2_RE : out STD_LOGIC;
           AddrMem_Ram2_WE : out STD_LOGIC;
           AddrMem_Ram2_EN : out STD_LOGIC );
end AddrMem;

architecture Behavioral of AddrMem is

begin

AddrMem_Ram2_Addr <= AddrMem_PC;
AddrMem_Ram2_EN <= '1';
AddrMem_Ram2_RE <= '1';
AddrMem_Ram2_WE <= '0';
AddrMem_Ins_OUT <= AddrMem_Data_IN;

end Behavioral;

