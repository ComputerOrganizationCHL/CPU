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
    Port ( DataMem_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Val_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           DataMem_RE : in  STD_LOGIC;
           DataMem_WE : in  STD_LOGIC;
           DataMem_Val_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end DataMem;

architecture Behavioral of DataMem is

begin


end Behavioral;

