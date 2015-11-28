----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:41:02 11/23/2015 
-- Design Name: 
-- Module Name:    DataMem - Behavioral 
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

entity DataMem is
    Port ( DataMem_CLK : in STD_LOGIC;
           DataMem_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           DataMem_RE : in  STD_LOGIC;
           DataMem_WE : in  STD_LOGIC;
           DataMem_EN : in  STD_LOGIC;
           DataMem_Val_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Val_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           
           DataMem_Stop_EN : out STD_LOGIC;                                  --interface to control EN in AddrMem
           
           DataMem_Ram2_Addr : out STD_LOGIC_VECTOR (15 downto 0);              --interface for Ram2
           DataMem_Ram2_Data : inout STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Ram2_OE : out STD_LOGIC;
           DataMem_Ram2_WE : out STD_LOGIC;
           DataMem_Ram2_EN : out STD_LOGIC;
           
           DataMem_Ram1_Addr : out STD_LOGIC_VECTOR (15 downto 0);              --interface for Ram1
           DataMem_Ram1_Data : inout STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Ram1_OE : out STD_LOGIC;
           DataMem_Ram1_WE : out STD_LOGIC;
           DataMem_Ram1_EN : out STD_LOGIC);
end DataMem;

architecture Behavioral of DataMem is

begin

process( DataMem_CLK, DataMem_EN)
begin
    if DataMem_CLK = '1' then
        if DataMem_RE = '1' and DataMem_WE = '0' and DataMem_EN = '1' then
            if DataMem_Addr <= "1011111011111111" then                      -- Select Ram2
                DataMem_Ram2_Addr <= DataMem_Addr;
                DataMem_Ram2_Data <= "ZZZZZZZZZZZZZZZZ";
                DataMem_Ram2_EN <= '0';
                DataMem_Ram2_OE <= '1';
                DataMem_Ram2_WE <= '1';
            else                                                            -- Select Ram1
                DataMem_Ram1_Addr <= DataMem_Addr;
                DataMem_Ram1_Data <= "ZZZZZZZZZZZZZZZZ";
                DataMem_Ram1_EN <= '0';
                DataMem_Ram1_OE <= '1';
                DataMem_Ram1_WE <= '1';
            end if;
        else
            if DataMem_RE = '0' and DataMem_WE = '1' and DataMem_EN = '1' then
                if DataMem_Addr <= "1011111011111111" then
                    DataMem_Ram2_Addr <= DataMem_Addr;
                    DataMem_Ram2_Data <= DataMem_Val_IN;
                    DataMem_Ram2_EN <= '0';
                    DataMem_Ram2_OE <= '1';
                    DataMem_Ram2_WE <= '1';
                else
                    DataMem_Ram1_Addr <= DataMem_Addr;
                    DataMem_Ram1_Data <= DataMem_Val_IN;
                    DataMem_Ram1_EN <= '0';
                    DataMem_Ram1_OE <= '1';
                    DataMem_Ram1_WE <= '1';
                end if;
            end if;
        end if;
    else
        if DataMem_CLK = '0' then
            if DataMem_RE = '1' and DataMem_WE = '0' and DataMem_EN = '1' then
                if DataMem_Addr <= "1011111011111111" then                      -- Select Ram2
                    DataMem_Ram2_EN <= '0';
                    DataMem_Ram2_OE <= '0';
                    DataMem_Ram2_WE <= '1';
                else                                                            -- Select Ram1
                    DataMem_Ram1_EN <= '0';
                    DataMem_Ram1_OE <= '0';
                    DataMem_Ram1_WE <= '1';
                end if;
            else
                if DataMem_RE = '0' and DataMem_WE = '1' and DataMem_EN = '1' then
                    if DataMem_Addr <= "1011111011111111" then
                        DataMem_Ram2_EN <= '0';
                        DataMem_Ram2_OE <= '1';
                        DataMem_Ram2_WE <= '0';
                    else
                        DataMem_Ram1_EN <= '0';
                        DataMem_Ram1_OE <= '1';
                        DataMem_Ram1_WE <= '0';
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;

process(DataMem_Ram1_Data)
begin
    if NOT(DataMem_Ram1_Data  = "ZZZZZZZZZZZZZZZZ") and DataMem_WE = '0' and DataMem_RE = '1' and DataMem_EN = '1' then
        DataMem_Val_OUT <= DataMem_Ram1_Data;
    end if;
end process;

process(DataMem_Ram2_Data)
begin
    if NOT(DataMem_Ram2_Data  = "ZZZZZZZZZZZZZZZZ") and DataMem_WE = '0' and DataMem_RE = '1' and DataMem_EN = '1' then
        DataMem_Val_OUT <= DataMem_Ram2_Data;
    end if;
end process;

process(DataMem_RE, DataMem_WE, DataMem_EN)
begin
    if DataMem_EN = '1' and DataMem_Addr <= "1011111011111111" then
        DataMem_Stop_EN <= '0';
    else
        DataMem_Stop_EN <= '1';
    end if;
end process;

end Behavioral;

