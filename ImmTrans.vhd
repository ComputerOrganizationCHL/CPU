----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:43 11/23/2015 
-- Design Name: 
-- Module Name:    ImmTrans - Behavioral 
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

entity ImmTrans is
    Port ( ImmTrans_Ins : in  STD_LOGIC_VECTOR (15 downto 0);
           ImmTrans_Imm : out  STD_LOGIC_VECTOR (15 downto 0));
end ImmTrans;

architecture Behavioral of ImmTrans is

begin


end Behavioral;

