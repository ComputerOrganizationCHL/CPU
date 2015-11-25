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
    Port (
           FwdUnit_Ex_Rs : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_Ex_Rt : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_ExToMem_RegWr : in  STD_LOGIC;
           FwdUnit_ExToMem_RegNum : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_MemToWr_RegMemSel : in STD_LOGIC;
           FwdUnit_MemToWr_RegWr : in  STD_LOGIC;
           FwdUnit_MemToWr_RegNum : in  STD_LOGIC_VECTOR (3 downto 0);
           FwdUnit_FwdRsSel : out  STD_LOGIC_VECTOR (1 downto 0);
           FwdUnit_FwdRtSel : out  STD_LOGIC_VECTOR (1 downto 0));
           --"00" : RsVal "01" ExToMem "10" WrReg "11" WrMem
end FwdUnit;

architecture Behavioral of FwdUnit is

begin

process(FwdUnit_Ex_Rs, FwdUnit_ExToMem_RegWr, FwdUnit_ExToMem_RegNum, FwdUnit_MemToWr_RegMemSel, FwdUnit_MemToWr_RegWr, FwdUnit_MemToWr_RegNum)
begin
    if (FwdUnit_ExToMem_RegWr = '1') then
        if (FwdUnit_Ex_Rs = FwdUnit_ExToMem_RegNum) then
            FwdUnit_FwdRsSel <= "01";
        else
            if (FwdUnit_Ex_Rs = FwdUnit_MemToWr_RegNum) then
                if (FwdUnit_MemToWr_RegMemSel = '0') then
                    FwdUnit_FwdRsSel <= "10";
                else
                    FwdUnit_FwdRsSel <= "11";
                end if;
            else
                FwdUnit_FwdRsSel <= "00";
            end if;
        end if;
    end if;
end process;


process(FwdUnit_Ex_Rt, FwdUnit_ExToMem_RegWr, FwdUnit_ExToMem_RegNum, FwdUnit_MemToWr_RegMemSel, FwdUnit_MemToWr_RegWr, FwdUnit_MemToWr_RegNum)
begin
    if (FwdUnit_ExToMem_RegWr = '1') then
        if (FwdUnit_Ex_Rt = FwdUnit_ExToMem_RegNum) then
            FwdUnit_FwdRtSel <= "01";
        else
            if (FwdUnit_Ex_Rt = FwdUnit_MemToWr_RegNum) then
                if (FwdUnit_MemToWr_RegMemSel = '0') then
                    FwdUnit_FwdRtSel <= "10";
                else
                    FwdUnit_FwdRtSel <= "11";
                end if;
            else
                FwdUnit_FwdRtSel <= "00";
            end if;
        end if;
    end if;
end process;

end Behavioral;

