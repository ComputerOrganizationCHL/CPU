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
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);

    elsif (MainCtrl_Ins(15 downto 11) = "01000" AND MainCtrl_Ins(4) = '0') then
    --ADDIU3
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        
        MainCtrl_Imm(15 downto 4)   <= (others => '0');
        MainCtrl_Imm(3 downto 0)    <= MainCtrl_Ins(3 downto 0);
        
    elsif (MainCtrl_Ins(15 downto 11) = "00000") then
    --ADDSP3
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '1';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "000";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);        

    elsif (MainCtrl_Ins(15 downto 8) = "01100011") then
    --ADDSP
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '1';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "000";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);

    elsif (MainCtrl_Ins(15 downto 11) = "11100" AND MainCtrl_Ins(1 downto 0) = "01") then
    --ADDU
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(4 downto 2);
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "01100") then
    --AND
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "100";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "00010") then
    --B
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '0';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "11";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '1';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "111";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 11)   <= (others => '0');
        MainCtrl_Imm(10 downto 0)    <= MainCtrl_Ins(10 downto 0);
        
    elsif (MainCtrl_Ins(15 downto 11) = "00100") then
    --BEQZ
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '1';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '0';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "10";
        MainCtrl_Jmp        <= '1';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);
        
    elsif (MainCtrl_Ins(15 downto 11) = "00101") then
    --BNEZ
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '1';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '0';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "11";
        MainCtrl_Jmp        <= '1';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);

    elsif (MainCtrl_Ins(15 downto 8) = "01100000") then
    --BTEQZ
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '1';
        MainCtrl_RsDedEn    <= '1';
        MainCtrl_RsDedSel   <= "11";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '0';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "11";
        MainCtrl_Jmp        <= '1';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "011";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);
        
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "01010") then
    --CMP
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "010";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "011";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "01110") then
    --CMPI
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "010";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "011";
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);

    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(7 downto 0) = "00000000") then
    --JR
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '0';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "01";
        MainCtrl_Jmp        <= '1';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "01101") then
    --LI
        MainCtrl_RsZero     <= '1';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '0';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "111";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);
        
    elsif (MainCtrl_Ins(15 downto 11) = "10011") then
    --LW
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '1';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "01";
        MainCtrl_MemRE      <= '1';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        
        MainCtrl_Imm(15 downto 5)   <= (others => '0');
        MainCtrl_Imm(4 downto 0)    <= MainCtrl_Ins(4 downto 0);
        
    elsif (MainCtrl_Ins(15 downto 11) = "10010") then
    --LW_SP
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '1';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '1';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '1';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "011";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        
        MainCtrl_Imm(15 downto 5)   <= (others => '0');
        MainCtrl_Imm(4 downto 0)    <= MainCtrl_Ins(4 downto 0);

    elsif (MainCtrl_Ins(15 downto 11) = "11110" AND MainCtrl_Ins(7 downto 0) = "00000000") then
    --MFIH
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '1';
        MainCtrl_RsDedEn    <= '1';
        MainCtrl_RsDedSel   <= "01";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "001";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(7 downto 0) = "01000000") then
    --MFPC
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '1';
        MainCtrl_RsDedEn    <= '1';
        MainCtrl_RsDedSel   <= "10";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "111";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "11110" AND MainCtrl_Ins(7 downto 0) = "00000001") then
    --MTIH
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '1';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "001";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 8) = "01100100" AND MainCtrl_Ins(4 downto 0) = "00000") then
    --MTSP
        MainCtrl_RsZero     <= '1';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "111";
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "000";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "01111") then
    --NOT
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "011";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "111";
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 0) = "0000100000000000") then
    --NOP
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '0';
        MainCtrl_SignExt    <= '0';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "111";
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "111";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');
        
    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "01101") then
    --OR
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "100";
        MainCtrl_ALUOr      <= '1';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "00110" AND MainCtrl_Ins(1 downto 0) = "00") then
    --SLL
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '0';
        MainCtrl_Width      <= "01";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "101";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '1';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "111";
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        
        MainCtrl_Imm(15 downto 3)   <= (others => '0');
        MainCtrl_Imm(2 downto 0)    <= MainCtrl_Ins(4 downto 2);

    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "00100") then
    --SLLV
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "101";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "01";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "11101" AND MainCtrl_Ins(4 downto 0) = "00010") then
    --SLT
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "111";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "011";
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');

    elsif (MainCtrl_Ins(15 downto 11) = "00110" AND MainCtrl_Ins(1 downto 0) = "11") then
    --SRA
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '0';
        MainCtrl_Width      <= "01";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "110";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '1';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '1';
        MainCtrl_Rs(2 downto 0) <= "111";
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        
        MainCtrl_Imm(15 downto 3)   <= (others => '0');
        MainCtrl_Imm(2 downto 0)    <= MainCtrl_Ins(4 downto 2);

    elsif (MainCtrl_Ins(15 downto 11) = "11100" AND MainCtrl_Ins(1 downto 0) = "11") then
    --SUBU
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '1';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "00";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '0';
        MainCtrl_ALUOp      <= "001";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "10";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '0';
        MainCtrl_Rd(2 downto 0) <= MainCtrl_Ins(4 downto 2);
        
        MainCtrl_Imm(15 downto 0)   <= (others => '0');
    
    elsif (MainCtrl_Ins(15 downto 11) = "11011") then
    --SW
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '0';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "01";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '1';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '1';
        MainCtrl_RsRegImmSel<= '0';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '1';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '0';
        MainCtrl_Rt(2 downto 0) <= MainCtrl_Ins(7 downto 5);
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 5)   <= (others => '0');
        MainCtrl_Imm(4 downto 0)    <= MainCtrl_Ins(4 downto 0);

    elsif (MainCtrl_Ins(15 downto 11) = "11010") then
    --SW_SP
        MainCtrl_RsZero     <= '0';
        MainCtrl_RtZero     <= '0';
        MainCtrl_RsDedEn    <= '0';
        MainCtrl_RsDedSel   <= "00";
        MainCtrl_RtDedEn    <= '0';
        MainCtrl_RtDedSel   <= "00";
        MainCtrl_RegMemSel  <= '0';
        MainCtrl_RegWr      <= '0';
        MainCtrl_SignExt    <= '1';
        MainCtrl_Width      <= "10";
        MainCtrl_MemRE      <= '0';
        MainCtrl_MemWE      <= '1';
        MainCtrl_ALUOp      <= "000";
        MainCtrl_ALUOr      <= '0';
        MainCtrl_RtRegImmSel<= '0';
        MainCtrl_RsRegImmSel<= '1';
        MainCtrl_RsRtRdSel  <= "00";
        MainCtrl_DiRsRtSel  <= '0';
        MainCtrl_Brh        <= "00";
        MainCtrl_Jmp        <= '0';
        
        MainCtrl_Rs(3)          <= '0';
        MainCtrl_Rs(2 downto 0) <= MainCtrl_Ins(10 downto 8);
        MainCtrl_Rt(3)          <= '1';
        MainCtrl_Rt(2 downto 0) <= "000";
        MainCtrl_Rd(3)          <= '1';
        MainCtrl_Rd(2 downto 0) <= "111";
        
        MainCtrl_Imm(15 downto 8)   <= (others => '0');
        MainCtrl_Imm(7 downto 0)    <= MainCtrl_Ins(7 downto 0);
        
    end if;
end process;



end Behavioral;

