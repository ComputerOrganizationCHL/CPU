----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    19:57:49 11/25/2015
-- Design Name:
-- Module Name:    Mux - Behavioral
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

entity Mux2 is
    Port ( Mux2_0 : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux2_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux2_Sel : in  STD_LOGIC;
           Mux2_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end Mux2;

architecture Behavioral of Mux2 is

begin

Mux2_OUT <= Mux2_0 when Mux2_Sel = '0' else
            Mux2_1 when Mux2_Sel = '1';

end Behavioral;
