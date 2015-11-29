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

entity Mux2_18 is
    Port ( Mux2_18_0 : in  STD_LOGIC_VECTOR (17 downto 0);
           Mux2_18_1 : in  STD_LOGIC_VECTOR (17 downto 0);
           Mux2_18_Sel : in  STD_LOGIC;
           Mux2_18_OUT : out  STD_LOGIC_VECTOR (17 downto 0));
end Mux2_18;

architecture Behavioral of Mux2_18 is

begin

process(Mux2_18_0, Mux2_18_1, Mux2_18_Sel)
begin

    case Mux2_18_Sel is
        when '0' =>
            Mux2_18_OUT <= Mux2_18_0;
        when '1' =>
            Mux2_18_OUT <= Mux2_18_1;
        when others =>

    end case;

end process;


end Behavioral;
