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
    Port ( RegFile_WE : in  STD_LOGIC;
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

process(RegFile_WE, RegFile_Rs, RegFile_Rt, RegFile_RegNum, RegFile_RegVal)       -- main process
begin
    if RegFile_WE = '0' then
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
        
        SP_OUT <= SP;
        IH_OUT <= IH;
        RA_OUT <= RA;
        T_OUT  <= T;
    else
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

