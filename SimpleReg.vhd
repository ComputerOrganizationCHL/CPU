----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:01 11/27/2015 
-- Design Name: 
-- Module Name:    SimpleReg - Behavioral 
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

entity SimpleReg is
    Port ( SimpleReg_Ins : in  STD_LOGIC_VECTOR (15 downto 0);
           SimpleReg_Rs : out  STD_LOGIC_VECTOR (2 downto 0);
           SimpleReg_Rt : out  STD_LOGIC_VECTOR (2 downto 0));
end SimpleReg;

architecture Behavioral of SimpleReg is

begin

    SimpleReg_Rs <= SimpleReg_Ins(10 downto 8);
    SimpleReg_Rt <= SimpleReg_Ins(7 downto 5);


end Behavioral;

