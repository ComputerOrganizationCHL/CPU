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

entity Mux is
    Port ( Mux_DeaVal : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux_MemVal : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux_WrRegVal : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux_WrMemVal : in  STD_LOGIC_VECTOR (15 downto 0);
           Mux_Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Mux_Val_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end Mux;

architecture Behavioral of Mux is

begin

process(Mux_DeaVal, Mux_MemVal, Mux_WrRegVal, Mux_WrMemVal, Mux_Sel)
begin

    case Mux_Sel is
        when "00" =>
            Mux_Val_OUT <= Mux_DeaVal;
        when "01" =>
            Mux_Val_OUT <= Mux_MemVal;
        when "10" =>
            Mux_Val_OUT <= Mux_WrRegVal;
        when "11" =>
            Mux_Val_OUT <= Mux_WrMemVal;
        when others =>
        
    end case;

end process;


end Behavioral;

