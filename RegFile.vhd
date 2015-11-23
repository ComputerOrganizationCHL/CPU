----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:30 11/23/2015 
-- Design Name: 
-- Module Name:    RegFile - Behavioral 
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

entity RegFile is
    Port ( RegFile_WE : in  STD_LOGIC;
           RegFile_Ra : in  STD_LOGIC_VECTOR (3 downto 0);
           RegFile_Rb : in  STD_LOGIC_VECTOR (3 downto 0);
           RegFile_RegNum : in  STD_LOGIC_VECTOR (3 downto 0);
           RegFile_RegVal : in  STD_LOGIC_VECTOR (15 downto 0);
           RegFile_Da : out  STD_LOGIC_VECTOR (15 downto 0);
           RegFile_Db : out  STD_LOGIC_VECTOR (15 downto 0));
end RegFile;

architecture Behavioral of RegFile is

begin


end Behavioral;

