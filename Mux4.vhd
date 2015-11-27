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

entity Mux4 is
    Port ( Mux4_00 : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux4_01 : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux4_10 : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux4_11 : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux4_Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Mux4_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end Mux4;

architecture Behavioral of Mux4 is

begin

process(Mux4_00, Mux4_01, Mux4_10, Mux4_11, Mux4_Sel)
begin

    case Mux4_Sel is
        when "00" =>
            Mux4_OUT <= Mux4_00;
        when "01" =>
            Mux4_OUT <= Mux4_01;
        when "10" =>
            Mux4_OUT <= Mux4_10;
        when "11" =>
            Mux4_OUT <= Mux4_11;
        when others =>
        
    end case;

end process;


end Behavioral;

