----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:00 11/23/2015 
-- Design Name: 
-- Module Name:    LoadUse - Behavioral 
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

entity LoadUse is
    Port ( LoadUse_Id_Rs : in  STD_LOGIC_VECTOR (3 downto 0);
           LoadUse_Id_Rt : in  STD_LOGIC_VECTOR (3 downto 0);
           LoadUse_Ex_RegNum : in  STD_LOGIC_VECTOR (3 downto 0);
           LoadUse_Ex_MemRE : in  STD_LOGIC;
           LoadUse_En : out  STD_LOGIC);--Connnected to PC.En, IfToId.En, IdToEx.Reset
end LoadUse;

architecture Behavioral of LoadUse is

begin

process(LoadUse_Id_Rs, LoadUse_Id_Rt, LoadUse_Ex_RegNum, LoadUse_Ex_MemRE)
begin
    if (LoadUse_Ex_MemRE = '1') then
        if (LoadUse_Id_Rs = LoadUse_Ex_RegNum) then
            LoadUse_En <= '0';
        else
            if (LoadUse_Id_Rt = LoadUse_Ex_RegNum) then
                LoadUse_En <= '0';
            else
                LoadUse_En <= '1';
            end if;
        end if;
    else
        LoadUse_En <= '1';
    end if;

end process;


end Behavioral;

