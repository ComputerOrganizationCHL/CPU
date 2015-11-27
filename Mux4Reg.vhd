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

entity Mux4Reg is
    Port ( Mux4Reg_00 : in  STD_LOGIC_VECTOR (3 downto 0);
           Mux4Reg_01 : in  STD_LOGIC_VECTOR (3 downto 0);
           Mux4Reg_10 : in  STD_LOGIC_VECTOR (3 downto 0);
           Mux4Reg_11 : in  STD_LOGIC_VECTOR (3 downto 0);
           Mux4Reg_Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Mux4Reg_OUT : out  STD_LOGIC_VECTOR (3 downto 0));
end Mux4Reg;

architecture Behavioral of Mux4Reg is

begin

process(Mux4Reg_00, Mux4Reg_01, Mux4Reg_10, Mux4Reg_11, Mux4Reg_Sel)
begin

    case Mux4Reg_Sel is
        when "00" =>
            Mux4Reg_OUT <= Mux4Reg_00;
        when "01" =>
            Mux4Reg_OUT <= Mux4Reg_01;
        when "10" =>
            Mux4Reg_OUT <= Mux4Reg_10;
        when "11" =>
            Mux4Reg_OUT <= Mux4Reg_11;
        when others =>
        
    end case;

end process;


end Behavioral;

