----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:30 11/23/2015 
-- Design Name: 
-- Module Name:    RegFile - Behavioral 
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

entity RegFile is
    Port ( RegFile_CLK : in STD_LOGIC;
           RegFile_WE : in  STD_LOGIC;
           RegFile_Rs : in  STD_LOGIC_VECTOR (2 downto 0);
           RegFile_Rt : in  STD_LOGIC_VECTOR (2 downto 0);
           RegFile_RegNum : in  STD_LOGIC_VECTOR (3 downto 0);--For write --000~111 gr, 1000~1011 SP IH RA T
           RegFile_RegVal : in  STD_LOGIC_VECTOR (15 downto 0);--For write
           RegFile_RsVal : out  STD_LOGIC_VECTOR (15 downto 0);
           RegFile_RtVal : out  STD_LOGIC_VECTOR (15 downto 0);
           SP_OUT : out STD_LOGIC_VECTOR (15 downto 0);
           IH_OUT : out STD_LOGIC_VECTOR (15 downto 0);
           RA_OUT : out STD_LOGIC_VECTOR (15 downto 0);
           T_OUt : out STD_LOGIC_VECTOR (15 downto 0));
end RegFile;

architecture Behavioral of RegFile is

    signal R0 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal R1 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal R2 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal R3 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal R4 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal R5 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal R6 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal R7 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    signal SP : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal IH : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal RA : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal T  : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');


begin

SP_OUT <= SP;
IH_OUT <= IH;
RA_OUT <= RA;
T_OUT  <= T;

process(RegFile_Rs,R0,R1,R2,R3,R4,R5,R6,R7)                     --read Rs process
begin
        case RegFile_Rs is
            when "000" =>
                RegFile_RsVal <= R0;
            when "001" =>
                RegFile_RsVal <= R1;
            when "010" =>
                RegFile_RsVal <= R2;
            when "011" =>
                RegFile_RsVal <= R3;
            when "100" =>
                RegFile_RsVal <= R4;
            when "101" =>
                RegFile_RsVal <= R5;
            when "110" =>
                RegFile_RsVal <= R6;
            when "111" =>
                RegFile_RsVal <= R7;
            when others =>
        end case;
end process;


process(RegFile_Rt,R0,R1,R2,R3,R4,R5,R6,R7)                         --read Rt process
begin
        case RegFile_Rt is
            when "000" =>
                RegFile_RtVal <= R0;
            when "001" =>
                RegFile_RtVal <= R1;
            when "010" =>
                RegFile_RtVal <= R2;
            when "011" =>
                RegFile_RtVal <= R3;
            when "100" =>
                RegFile_RtVal <= R4;
            when "101" =>
                RegFile_RtVal <= R5;
            when "110" =>
                RegFile_RtVal <= R6;
            when "111" =>
                RegFile_RtVal <= R7;
            when others =>
        end case;
   
end process;

process(RegFile_CLK)         --write process
begin
    if RegFile_WE = '1' and rising_edge(RegFile_CLK) then
        case RegFile_RegNum is
            when "0000" =>
                R0 <= RegFile_RegVal;
            when "0001" =>
                R1 <= RegFile_RegVal;
            when "0010" =>
                R2 <= RegFile_RegVal;
            when "0011" =>
                R3 <= RegFile_RegVal;
            when "0100" =>
                R4 <= RegFile_RegVal;
            when "0101" =>
                R5 <= RegFile_RegVal;
            when "0110" =>
                R6 <= RegFile_RegVal;
            when "0111" =>
                R7 <= RegFile_RegVal;
                
            when "1000" =>
                SP <= RegFile_RegVal;
            when "1001" =>
                IH <= RegFile_RegVal;
            when "1010" =>
                RA <= RegFile_RegVal;
            when "1011" =>
                T  <= RegFile_RegVal;
            when others =>
        end case;
    end if;

end process;

end Behavioral;

