----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:55 11/24/2015 
-- Design Name: 
-- Module Name:    BrhUnit - Behavioral 
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
use IEEE.STD_LOGIC_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BrhUnit is
    Port ( BrhUnit_Brh : in  STD_LOGIC_VECTOR (1 downto 0);
           BrhUnit_Jmp : in  STD_LOGIC;
           BrhUnit_RsVal : in  STD_LOGIC_VECTOR (15 downto 0);
           BrhUnit_RtVal : in  STD_LOGIC_VECTOR (15 downto 0);
           BrhUnit_Imm : in  STD_LOGIC_VECTOR (15 downto 0);
           BrhUnit_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           BrhUnit_JmpPC : out  STD_LOGIC_VECTOR (15 downto 0);
           BrhUnit_PCSel : out  STD_LOGIC);--PCSel's NOT connneted to IfToId.Reset
end BrhUnit;

architecture Behavioral of BrhUnit is

begin

process(BrhUnit_Brh, BrhUnit_Jmp, BrhUnit_RsVal, BrhUnit_RtVal, BrhUnit_Imm, BrhUnit_PC)
begin
    case BrhUnit_Brh is
        when "00" =>
            BrhUnit_JmpPC <= BrhUnit_PC + BrhUnit_Imm;
            BrhUnit_PCSel <= BrhUnit_Jmp;
            
        when "01" =>
            BrhUnit_JmpPC <= BrhUnit_PC + BrhUnit_RsVal;
            BrhUnit_PCSel <= BrhUnit_Jmp;
            
        when "10" =>
            BrhUnit_JmpPC <= BrhUnit_PC + BrhUnit_Imm;
            if (BrhUnit_RsVal = BrhUnit_RtVal) then
                BrhUnit_PCSel <= BrhUnit_Jmp;
            else
                BrhUnit_PCSel <= '0';
            end if;
        when "11" =>
            BrhUnit_JmpPC <= BrhUnit_PC + BrhUnit_Imm;
            if (BrhUnit_RsVal /= BrhUnit_RtVal) then
                BrhUnit_PCSel <= BrhUnit_Jmp;
            else
                BrhUnit_PCSel <= '0';
            end if;
        when others =>
            BrhUnit_JmpPC <= BrhUnit_PC;
    end case;
end process;

end Behavioral;

