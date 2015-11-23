----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:41:08 11/22/2015 
-- Design Name: 
-- Module Name:    MemToWr - Behavioral 
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

entity MemToWr is
    Port ( MemToWr_En : in  STD_LOGIC;
           MemToWr_RegMemSel_IN : in  STD_LOGIC;
           MemToWr_RegWr_IN : in  STD_LOGIC;
           MemToWr_MemVal_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           MemToWr_RegVal_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           MemToWr_RegOverflow_IN : in  STD_LOGIC;
           MemToWr_RegNum_IN : in  STD_LOGIC_VECTOR(2 downto 0);
           MemToWr_RegMemSel_OUT : out  STD_LOGIC;
           MemToWr_RegWr_OUT : out  STD_LOGIC;
           MemToWr_MemVal_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           MemToWr_RegVal_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           MemToWr_RegOverflow_OUT : out  STD_LOGIC;
           MemToWr_RegNum_OUT : out  STD_LOGIC_VECTOR(2 downto 0)
			  );
end MemToWr;

architecture Behavioral of MemToWr is

begin


end Behavioral;

