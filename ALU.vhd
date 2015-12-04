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
use IEEE.STD_LOGIC_signed.all;
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
           ALU_ALUOr : in  STD_LOGIC;
           ALU_RsVal : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU_RtVal : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU;


architecture Behavioral of ALU is

begin

ALU_OUT <= ALU_RsVal + ALU_RtVal when ALU_ALUOp = "000" else
           ALU_RsVal - ALU_RtVal when ALU_ALUOp = "001" else
           "0000000000000001"    when ALU_ALUOp = "010" and ALU_RsVal /= ALU_RtVal else
           NOT ALU_RtVal         when ALU_ALUOp = "011" else
           ALU_RsVal OR ALU_RtVal when ALU_ALUOp = "100" and ALU_ALUOr = '1' else
           ALU_RsVal AND ALU_RtVal when ALU_ALUOp = "100" and ALU_ALUOr = '0' else
           to_stdlogicvector(to_bitvector(ALU_RtVal) SLL conv_integer(ALU_RsVal)) when ALU_ALUOp = "101" else
           to_stdlogicvector(to_bitvector(ALU_RtVal) SRA conv_integer(ALU_RsVal)) when ALU_ALUOp = "110" else
           "0000000000000001" when ALU_RsVal < ALU_RtVal else
           "0000000000000000";

end Behavioral;

