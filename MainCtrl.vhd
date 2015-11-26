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
           MainCtrl_RsZero : out STD_LOGIC;
           MainCtrl_RtZero : out STD_LOGIC;
           MainCtrl_RsDedEn : out STD_LOGIC;
           MainCtrl_RsDedSel : out STD_LOGIC_VECTOR(1 downto 0);
           MainCtrl_RtDedEn : out STD_LOGIC;
           MainCtrl_RtDedSel : out STD_LOGIC_VECTOR(1 downto 0);
           MainCtrl_RegMemSel : out STD_LOGIC;
           MainCtrl_RegWr : out STD_LOGIC;
           MainCtrl_SignExt : out STD_LOGIC;
           MainCtrl_Width : out STD_LOGIC_VECTOR(1 downto 0);
           MainCtrl_MemRE : out STD_LOGIC;
           MainCtrl_MemWE : out STD_LOGIC;
           MainCtrl_ALUOp : out STD_LOGIC_VECTOR(2 downto 0);
           MainCtrl_ALUOr : out STD_LOGIC;
           MainCtrl_RtRegImmSel : out STD_LOGIC;
           MainCtrl_RsRegImmSel : out STD_LOGIC;
           MainCtrl_RsRtRdSel : out STD_LOGIC_VECTOR(1 downto 0);
           MainCtrl_DiRsRtSel : out STD_LOGIC;
           MainCtrl_Brh : out STD_LOGIC_VECTOR(1 downto 0);
           MainCtrl_Jmp : out STD_LOGIC;
           MainCtrl_Rs : out STD_LOGIC_VECTOR(3 downto 0);
           MainCtrl_Rt : out STD_LOGIC_VECTOR(3 downto 0);
           MainCtrl_Rd : out STD_LOGIC_VECTOR(3 downto 0);
           MainCtrl_Imm : out STD_LOGIC_VECTOR(15 downto 0));
           
end MainCtrl;

architecture Behavioral of MainCtrl is

begin

process(MainCtrl_Ins)
begin
    if (MainCtrl_Ins(15 downto 11) = "01001") then
    --ADDIU
    elsif (MainCtrl_Ins(15 downto 11) = "01000" AND MainCtrl_Ins(4) = '0') then
    --ADDIU3
    elsif (MainCtrl_Ins(15 downto 11) = "00000") then
    --ADDSP3
    elsif (MainCtrl_Ins(15 downto 8) = "01100011") then
    --ADDSP
    elsif (MainCtrl_Ins(15 downto 11) = "11100" AND MainCtrl_Ins(1 downto 0) = "01") then
    --ADDU
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "01100") then
    --AND
    elsif (MainCtrl_Ins(15 downto 11) = "00010") then
    --B
    elsif (MainCtrl_Ins(15 downto 11) = "00100") then
    --BEQZ
    elsif (MainCtrl_Ins(15 downto 11) = "00101") then
    --BNEZ
    elsif (MainCtrl_Ins(15 downto 8) = "01100000") then
    --BTEQZ
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "01010") then
    --CMP
    elsif (MainCtrl_Ins(15 downto 11) = "01110") then
    --CMPI
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(7 downto 0) = "00000000") then
    --JR
    elsif (MainCtrl_Ins(15 downto 11) = "01101") then
    --LI
    elsif (MainCtrl_Ins(15 downto 11) = "10011") then
    --LW
    elsif (MainCtrl_Ins(15 downto 11) = "10010") then
    --LW_SP
    elsif (MainCtrl_Ins(15 downto 11) = "11110" AND MainCtrl_Ins(7 downto 0) = "00000000") then
    --MFIH
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(7 downto 0) = "01000000") then
    --MFPC
    elsif (MainCtrl_Ins(15 downto 11) = "11110" AND MainCtrl_Ins(7 downto 0) = "00000001") then
    --MTIH
    elsif (MainCtrl_Ins(15 downto 8) = "01100100" AND MainCtrl_Ins(4 downto 0) = "00000") then
    --MTSP
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "01111") then
    --NOT
    elsif (MainCtrl_Ins(15 downto 0) = "0000100000000000") then
    --NOP
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "01101") then
    --OR
    elsif (MainCtrl_Ins(15 downto 11) = "00110" AND MainCtrl_Ins(1 downto 0) = "00") then
    --SLL
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "00100") then
    --SLLV
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "00010") then
    --SLT
    elsif (MainCtrl_Ins(15 downto 11) = "00110" AND MainCtrl_Ins(1 downto 0) = "11") then
    --SRA
    elsif (MainCtrl_Ins(15 downto 11) = "11100" AND MainCtrl_Ins(1 downto 0) = "11") then
    --SUBU
    elsif (MainCtrl_Ins(15 downto 11) = "11011") then
    --SW
    elsif (MainCtrl_Ins(15 downto 11) = "11010") then
    --SW_SP
    end if;
end process;



end Behavioral;

