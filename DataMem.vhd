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
    Port ( DataMem_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           DataMem_RE : in  STD_LOGIC;
           DataMem_WE : in  STD_LOGIC;
           DataMem_EN : in  STD_LOGIC;
           DataMem_Val_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Val_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           
           DataMem_Stop_EN : out STD_LOGIC;                                  --interface to control EN in AddrMem
           
           DataMem_Ram2_Addr : out STD_LOGIC_VECTOR (15 downto 0);              --interface for Ram2
           DataMem_Ram2_Data_IN : in STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Ram2_Data_OUT : out STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Ram2_RE : out STD_LOGIC;
           DataMem_Ram2_WE : out STD_LOGIC;
           DataMem_Ram2_EN : out STD_LOGIC;
           
           DataMem_Ram1_Addr : out STD_LOGIC_VECTOR (16 downto 0);              --interface for Ram1
           DataMem_Ram1_Data_IN : in STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Ram1_Data_OUT : out STD_LOGIC_VECTOR (15 downto 0);
           DataMem_Ram1_RE : out STD_LOGIC;
           DataMem_Ram1_WE : out STD_LOGIC;
           DataMem_Ram1_EN : out STD_LOGIC);
end DataMem;

architecture Behavioral of DataMem is

begin

DataMem_Ram1_Addr <= DataMem_Addr   when DataMem_Addr >= "1011111100000000";
DataMem_Ram1_EN <= '1'              when DataMem_Addr >= "1011111100000000" and DataMem_EN = '1' else '0';
DataMem_Ram1_RE <= DataMem_RE       when DataMem_Addr >= "1011111100000000";       
DataMem_Ram1_WE <= DataMem_WE       when DataMem_Addr >= "1011111100000000";   
DataMem_Ram1_Data_OUT <= DataMem_Val_IN
                                    when DataMem_Addr >= "1011111100000000" and
                                         DataMem_RE = '0' and DataMem_WE = '1'; 
DataMem_Val_OUT <= DataMem_Ram1_Data_IN
                                    when DataMem_Addr >= "1011111100000000" and
                                         DataMem_RE = '1' and DataMem_WE = '0'; 


DataMem_Ram2_Addr <= DataMem_Addr   when DataMem_Addr <  "1011111100000000";
DataMem_Ram2_EN <= '1'              when DataMem_Addr <  "1011111100000000" and DataMem_EN = '1' else '0';
DataMem_Ram2_RE <= DataMem_RE       when DataMem_Addr <  "1011111100000000";
DataMem_Ram2_We <= DataMem_WE       when DataMem_Addr <  "1011111100000000";
DataMem_Ram2_Data_OUT <= DataMem_Val_IN
                                    when DataMem_Addr <  "1011111100000000" and
                                         DataMem_RE = '0' and DataMem_WE = '1'; 
DataMem_Val_OUT <= DataMem_Ram2_Data_IN
                                    when DataMem_Addr <  "1011111100000000" and
                                         DataMem_RE = '1' and DataMem_WE = '0'; 

DataMem_Stop_EN <= '0'              when DataMem_Addr <  "1011111100000000";

end Behavioral;

