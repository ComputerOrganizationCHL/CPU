----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:50 11/25/2015 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
USE IEEE.STD_LOGIC_signed.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( ALU_ALUOp : in  STD_LOGIC_VECTOR (2 downto 0);
           ALU_RsVal : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU_RtVal : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(ALU_ALUOp, ALU_RsVal, ALU_RtVal)
begin
    case ALU_ALUOp is
        when "000" =>
            --加法,OUT = Rs + Rt
            ALU_OUT <= ALU_RsVal + ALU_RtVal;
        when "001" =>
            --减法，OUT = Rs - Rt
            ALU_OUT <= ALU_RsVal - ALU_RtVal;
        when "010" =>
            --比较, OUT = !(Rs == Rt)
            if (ALU_RsVal = ALU_RtVal) then
                ALU_OUT <= "0000000000000000";
            else
                ALU_OUT <= "0000000000000001";
            end if;
        when "011" =>
            --取反, OUT = ~Rs
            ALU_OUT <= NOT ALU_RsVal;
        when "100" =>
            --或操作, OUT <= Rs | Rt
            ALU_OUT <= ALU_RsVal OR ALU_RtVal;
        when "101" =>
            --左移操作, OUT <= Rs << Rt
            ALU_OUT <= to_stdlogicvector(to_bitvector(ALU_RsVal) SLL conv_integer(ALU_RtVal));
        when "110" =>
            --右移操作, OUT <= Rs << Rt
            ALU_OUT <= to_stdlogicvector(to_bitvector(ALU_RsVal) SRA conv_integer(ALU_RtVal));
        when "111" =>
            --小于等于操作, ALU_OUT <= (ALU_RsVal < ALU_RtVal)
            if (ALU_RsVal < ALU_RtVal) then
                ALU_OUT <= "0000000000000001";
            else
                ALU_OUT <= "0000000000000000";
            end if;
        when others =>
            ALU_OUT <= ALU_RsVal;
    end case;
end process;

end Behavioral;

