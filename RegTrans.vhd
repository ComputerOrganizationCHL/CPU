----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:39:22 11/23/2015 
-- Design Name: 
-- Module Name:    RegTrans - Behavioral 
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

entity RegTrans is
    Port ( RegTrans_Op : in  STD_LOGIC_VECTOR (4 downto 0);
           RegTrans_Rs_IN : in  STD_LOGIC_VECTOR (2 downto 0);
           RegTrans_Rt_IN : in  STD_LOGIC_VECTOR (2 downto 0);
           RegTrans_Rd_IN : in  STD_LOGIC_VECTOR (2 downto 0);
           RegTrans_Rs_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           RegTrans_Rt_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           RegTrans_Rd_OUT : out  STD_LOGIC_VECTOR (3 downto 0));
end RegTrans;

architecture Behavioral of RegTrans is

begin


end Behavioral;

