----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:14 11/23/2015 
-- Design Name: 
-- Module Name:    MainCtrl - Behavioral 
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

entity MainCtrl is
    Port ( MainCtrl_Ins : in  STD_LOGIC_VECTOR (15 downto 0);
           MainCtrl_Wr_RegMemSel : out  STD_LOGIC;
           MainCtrl_Wr_RegWr : out  STD_LOGIC;
           MainCtrl_Mem_MemRE : out  STD_LOGIC;
           MainCtrl_Mem_MemWE : out  STD_LOGIC;
           MainCtrl_Ex_ALUOp : out  STD_LOGIC_VECTOR (3 downto 0);
           MainCtrl_Ex_RtRegImmSel : out  STD_LOGIC;
           MainCtrl_Ex_RtRdSel : out  STD_LOGIC;
           MainCtrl_BrhSel : out  STD_LOGIC;
           MainCtrl_JmpSel : out  STD_LOGIC);
end MainCtrl;

architecture Behavioral of MainCtrl is

begin


end Behavioral;

