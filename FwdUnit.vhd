----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:31:07 11/22/2015 
-- Design Name: 
-- Module Name:    FwdUnit - Behavioral 
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

entity FwdUnit is
    Port ( FwdUnit_Id_Rs : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_Id_Rt : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_Ex_Rs : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_Ex_Rt : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_ExToMem_RegWr : in  STD_LOGIC;
           FwdUnit_ExToMem_RegNum : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_MemToWr_RegWr : in  STD_LOGIC;
           FwdUnit_MemToWr_RegNum : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_MemToWr_RegMemSel : in STD_LOGIC;
           FwdUnit_Id_Rs_FwdSel : out  STD_LOGIC_VECTOR (1 downto 0);
           FwdUnit_Id_Rt_FwdSel : out  STD_LOGIC_VECTOR (1 downto 0);
           FwdUnit_Ex_Rs_FwdSel : out  STD_LOGIC_VECTOR (1 downto 0);
           FwdUnit_Ex_Rt_FwdSel : out  STD_LOGIC_VECTOR (1 downto 0));
end FwdUnit;

architecture Behavioral of FwdUnit is

begin


end Behavioral;

