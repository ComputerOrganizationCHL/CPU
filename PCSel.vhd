----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:47 11/23/2015 
-- Design Name: 
-- Module Name:    PCSel - Behavioral 
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

entity PCSel is
    Port ( PC_EN : in  STD_LOGIC;
           PC_RESET : in  STD_LOGIC;
           PC_NextPC_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_NextPC_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end PCSel;

architecture Behavioral of PCSel is

begin


end Behavioral;

