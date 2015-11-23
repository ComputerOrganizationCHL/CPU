----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:07:37 11/22/2015 
-- Design Name: 
-- Module Name:    ExToMem - Behavioral 
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


entity ExToMem is
    Port ( ExToMem_En : in  STD_LOGIC;
           ExToMem_PC_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_Wr_RegMemSel_IN : in  STD_LOGIC;
           ExToMem_Wr_RegWr_IN : in  STD_LOGIC;
           ExToMem_MemRE_IN : in  STD_LOGIC;
			  ExToMem_MemWE_IN : in  STD_LOGIC;
           ExToMem_MemVal_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_MemAddr_IN : in  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_RegOverflow_IN : in  STD_LOGIC;
           ExToMem_RegNum_IN : in  STD_LOGIC_VECTOR(3 downto 0);
           ExToMem_PC_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_Wr_RegMemSel_OUT : out  STD_LOGIC;
           ExToMem_Wr_RegWr_OUT : out  STD_LOGIC;
           ExToMem_MemRE_OUT : out  STD_LOGIC;
			  ExToMem_MemWE_OUT : out  STD_LOGIC;
           ExToMem_MemVal_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_MemAddr_OUT : out  STD_LOGIC_VECTOR(15 downto 0);
           ExToMem_RegOverflow_OUT : out  STD_LOGIC;
           ExToMem_RegNum_OUT : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end ExToMem;

architecture Behavioral of ExToMem is

begin


end Behavioral;

