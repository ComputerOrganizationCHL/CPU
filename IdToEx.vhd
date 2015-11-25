----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:33:15 11/23/2015 
-- Design Name: 
-- Module Name:    IdToEx - Behavioral 
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

entity IdToEx is
    Port ( IdToEx_EN : in  STD_LOGIC;
           IdToEx_PC_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_Wr_RegMemSel_IN : in  STD_LOGIC;
           IdToEx_Wr_RegWr_IN : in  STD_LOGIC;
           IdToEx_Mem_MemRE_IN : in  STD_LOGIC;
			  IdToEx_Mem_MemWE_IN : in  STD_LOGIC;
           IdToEx_ALUOp_IN : in  STD_LOGIC_VECTOR (3 downto 0);
			  IdToEx_Imm_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RtRegImmSel_IN : in  STD_LOGIC;
           IdToEx_RtRdSel_IN : in  STD_LOGIC;
           IdToEx_RsVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RtVal_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_Rs_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Rt_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Rd_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_PC_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_Wr_RegMemSel_OUT : out  STD_LOGIC;
           IdToEx_Wr_RegWr_OUT : out  STD_LOGIC;
           IdToEx_Mem_MemRE_OUT : out  STD_LOGIC;
			  IdToEx_Mem_MemWE_OUT : out  STD_LOGIC;
           IdToEx_ALUOp_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
			  IdToEx_Imm_OUT : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RtRegImmSel_OUT : out  STD_LOGIC;
           IdToEx_RtRdSel_OUT : out  STD_LOGIC;
           IdToEx_RsVal_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RtVal_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_Rs_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Rt_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
           IdToEx_Rd_OUT : out  STD_LOGIC_VECTOR (3 downto 0));
end IdToEx;

architecture Behavioral of IdToEx is

begin


end Behavioral;

