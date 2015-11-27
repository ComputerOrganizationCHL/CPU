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
    Port ( IdToEx_CLK : in STD_LOGIC;
           IdToEx_En : in  STD_LOGIC;
           IdToEx_Reset : in  STD_LOGIC;
           
           IdToEx_PC_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RegMemSel_IN : in STD_LOGIC;
           IdToEx_RegWr_IN : in STD_LOGIC;
           IdToEx_SignExt_IN : in STD_LOGIC;
           IdToEx_Width_IN : in STD_LOGIC_VECTOR(1 downto 0);
           IdToEx_MemRE_IN : in STD_LOGIC;
           IdToEx_MemWE_IN : in STD_LOGIC;
           IdToEx_ALUOp_IN : in STD_LOGIC_VECTOR(2 downto 0);
           IdToEx_ALUOr_IN : in STD_LOGIC;
           IdToEx_RtRegImmSel_IN : in STD_LOGIC;
           IdToEx_RsRegImmSel_IN : in STD_LOGIC;
           IdToEx_RsRtRdSel_IN : in STD_LOGIC_VECTOR(1 downto 0);
           IdToEx_DiRsRtSel_IN : in STD_LOGIC;
           IdToEx_Brh_IN : in STD_LOGIC_VECTOR(1 downto 0);
           IdToEx_Jmp_IN : in STD_LOGIC;
           IdToEx_Rs_IN : in STD_LOGIC_VECTOR(3 downto 0);
           IdToEx_Rt_IN : in STD_LOGIC_VECTOR(3 downto 0);
           IdToEx_Rd_IN : in STD_LOGIC_VECTOR(3 downto 0);
           IdToEx_Imm_IN : in STD_LOGIC_VECTOR(15 downto 0);
           IdToEx_RsVal_IN : in STD_LOGIC_VECTOR(15 downto 0);
           IdToEx_RtVal_IN : in STD_LOGIC_VECTOR(15 downto 0);
           
           IdToEx_PC_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           IdToEx_RegMemSel_OUT : out STD_LOGIC;
           IdToEx_RegWr_OUT : out STD_LOGIC;
           IdToEx_SignExt_OUT : out STD_LOGIC;
           IdToEx_Width_OUT : out STD_LOGIC_VECTOR(1 downto 0);
           IdToEx_MemRE_OUT : out STD_LOGIC;
           IdToEx_MemWE_OUT : out STD_LOGIC;
           IdToEx_ALUOp_OUT : out STD_LOGIC_VECTOR(2 downto 0);
           IdToEx_ALUOr_OUT : out STD_LOGIC;
           IdToEx_RtRegImmSel_OUT : out STD_LOGIC;
           IdToEx_RsRegImmSel_OUT : out STD_LOGIC;
           IdToEx_RsRtRdSel_OUT : out STD_LOGIC_VECTOR(1 downto 0);
           IdToEx_DiRsRtSel_OUT : out STD_LOGIC;
           IdToEx_Brh_OUT : out STD_LOGIC_VECTOR(1 downto 0);
           IdToEx_Jmp_OUT : out STD_LOGIC;
           IdToEx_Rs_OUT : out STD_LOGIC_VECTOR(3 downto 0);
           IdToEx_Rt_OUT : out STD_LOGIC_VECTOR(3 downto 0);
           IdToEx_Rd_OUT : out STD_LOGIC_VECTOR(3 downto 0);
           IdToEx_Imm_OUT : out STD_LOGIC_VECTOR(15 downto 0);
           IdToEx_RsVal_OUT : out STD_LOGIC_VECTOR(15 downto 0);
           IdToEx_RtVal_OUT : out STD_LOGIC_VECTOR(15 downto 0));
end IdToEx;

architecture Behavioral of IdToEx is
    signal PC : STD_LOGIC_VECTOR (15 downto 0);
    signal RegMemSel : STD_LOGIC;
    signal RegWr : STD_LOGIC;
    signal SignExt : STD_LOGIC;
    signal Width : STD_LOGIC_VECTOR(1 downto 0);
    signal MemRE : STD_LOGIC;
    signal MemWE : STD_LOGIC;
    signal ALUOp : STD_LOGIC_VECTOR(2 downto 0);
    signal ALUOr : STD_LOGIC;
    signal RtRegImmSel : STD_LOGIC;
    signal RsRegImmSel : STD_LOGIC;
    signal RsRtRdSel : STD_LOGIC_VECTOR(1 downto 0);
    signal DiRsRtSel : STD_LOGIC;
    signal Brh : STD_LOGIC_VECTOR(1 downto 0);
    signal Jmp : STD_LOGIC;
    signal Rs : STD_LOGIC_VECTOR(3 downto 0);
    signal Rt : STD_LOGIC_VECTOR(3 downto 0);
    signal Rd : STD_LOGIC_VECTOR(3 downto 0);
    signal Imm : STD_LOGIC_VECTOR(15 downto 0);
    signal RsVal : STD_LOGIC_VECTOR(15 downto 0);
    signal RtVal : STD_LOGIC_VECTOR(15 downto 0);
begin

process(IdToEx_CLK)
begin
    if (rising_edge(IdToEx_CLK)) then
        if (IdToEx_Reset = '1') then
            if (IdToEx_En = '1') then
                
                PC <= IdToEx_PC_IN;
                RegMemSel <= IdToEx_RegMemSel_IN;
                RegWr <= IdToEx_RegWr_IN;
                SignExt <= IdToEx_SignExt_IN;
                Width <= IdToEx_Width_IN;
                MemRE <= IdToEx_MemRE_IN;
                MemWE <= IdToEx_MemWE_IN;
                ALUOp <= IdToEx_ALUOp_IN;
                ALUOr <= IdToEx_ALUOr_IN;
                RtRegImmSel <= IdToEx_RtRegImmSel_IN;
                RsRegImmSel <= IdToEx_RsRegImmSel_IN;
                RsRtRdSel <= IdToEx_RsRtRdSel_IN;
                DiRsRtSel <= IdToEx_DiRsRtSel_IN;
                Brh <= IdToEx_Brh_IN;
                Jmp <= IdToEx_Jmp_IN;
                Rs <= IdToEx_Rs_IN;
                Rt <= IdToEx_Rt_IN;
                Rd <= IdToEx_Rd_IN;
                Imm <= IdToEx_Imm_IN;
                RsVal <= IdToEx_RsVal_IN;
                RtVal <= IdToEx_RtVal_IN;
            
                IdToEx_PC_OUT <= IdToEx_PC_IN;
                IdToEx_RegMemSel_OUT <= IdToEx_RegMemSel_IN;
                IdToEx_RegWr_OUT <= IdToEx_RegWr_IN;
                IdToEx_SignExt_OUT <= IdToEx_SignExt_IN;
                IdToEx_Width_OUT <= IdToEx_Width_IN;
                IdToEx_MemRE_OUT <= IdToEx_MemRE_IN;
                IdToEx_MemWE_OUT <= IdToEx_MemWE_IN;
                IdToEx_ALUOp_OUT <= IdToEx_ALUOp_IN;
                IdToEx_ALUOr_OUT <= IdToEx_ALUOr_IN;
                IdToEx_RtRegImmSel_OUT <= IdToEx_RtRegImmSel_IN;
                IdToEx_RsRegImmSel_OUT <= IdToEx_RsRegImmSel_IN;
                IdToEx_RsRtRdSel_OUT <= IdToEx_RsRtRdSel_IN;
                IdToEx_DiRsRtSel_OUT <= IdToEx_DiRsRtSel_IN;
                IdToEx_Brh_OUT <= IdToEx_Brh_IN;
                IdToEx_Jmp_OUT <= IdToEx_Jmp_IN;
                IdToEx_Rs_OUT <= IdToEx_Rs_IN;
                IdToEx_Rt_OUT <= IdToEx_Rt_IN;
                IdToEx_Rd_OUT <= IdToEx_Rd_IN;
                IdToEx_Imm_OUT <= IdToEx_Imm_IN;
                IdToEx_RsVal_OUT <= IdToEx_RsVal_IN;
                IdToEx_RtVal_OUT <= IdToEx_RtVal_IN;
            else
                
                IdToEx_PC_OUT <= PC;
                IdToEx_RegMemSel_OUT <= RegMemSel;
                IdToEx_RegWr_OUT <= RegWr;
                IdToEx_SignExt_OUT <= SignExt;
                IdToEx_Width_OUT <= Width;
                IdToEx_MemRE_OUT <= MemRE;
                IdToEx_MemWE_OUT <= MemWE;
                IdToEx_ALUOp_OUT <= ALUOp;
                IdToEx_ALUOr_OUT <= ALUOr;
                IdToEx_RtRegImmSel_OUT <= RtRegImmSel;
                IdToEx_RsRegImmSel_OUT <= RsRegImmSel;
                IdToEx_RsRtRdSel_OUT <= RsRtRdSel;
                IdToEx_DiRsRtSel_OUT <= DiRsRtSel;
                IdToEx_Brh_OUT <= Brh;
                IdToEx_Jmp_OUT <= Jmp;
                IdToEx_Rs_OUT <= Rs;
                IdToEx_Rt_OUT <= Rt;
                IdToEx_Rd_OUT <= Rd;
                IdToEx_Imm_OUT <= Imm;
                IdToEx_RsVal_OUT <= RsVal;
                IdToEx_RtVal_OUT <= RtVal;
            end if;
        else
            PC <= "0000000000000000";
            RegMemSel <= '0';
            RegWr <= '0';
            SignExt <= '0';
            Width <= "00";
            MemRE <= '0';
            MemWE <= '0';
            ALUOp <= "000";
            ALUOr <= '0';
            RtRegImmSel <= '0';
            RsRegImmSel <= '0';
            RsRtRdSel <= "00";
            DiRsRtSel <= '0';
            Brh <= "00";
            Jmp <= '0';
            Rs <= "0000";
            Rt <= "0000";
            Rd <= "0000";
            Imm <= "0000000000000000";
            RsVal <= "0000000000000000";
            RtVal <= "0000000000000000";
            
        end if;
    end if;

end process;

end Behavioral;

