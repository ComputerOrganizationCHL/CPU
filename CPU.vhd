----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    13:59:48 11/27/2015
-- Design Name:
-- Module Name:    CPU - Behavioral
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

entity CPU is
end CPU;

architecture Behavioral of CPU is


    COMPONENT ALU
    PORT(
         ALU_ALUOp : IN  std_logic_vector(2 downto 0);
         ALU_ALUOr : IN  std_logic;
         ALU_RsVal : IN  std_logic_vector(15 downto 0);
         ALU_RtVal : IN  std_logic_vector(15 downto 0);
         ALU_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal ALU_ALUOp : std_logic_vector(2 downto 0) := (others => '0');
   signal ALU_ALUOr : std_logic := '0';
   signal ALU_RsVal : std_logic_vector(15 downto 0) := (others => '0');
   signal ALU_RtVal : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal ALU_OUT : std_logic_vector(15 downto 0);


    COMPONENT Adder
    PORT(
         Val_IN : IN  std_logic_vector(15 downto 0);
         Val_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal Val_IN : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Val_OUT : std_logic_vector(15 downto 0);


    COMPONENT AddrMem
    PORT(
         AddrMem_CLK : IN  std_logic;
         AddrMem_PC : IN  std_logic_vector(15 downto 0);
         AddrMem_EN : IN  std_logic;
         AddrMem_Ins_OUT : OUT  std_logic_vector(15 downto 0);
         AddrMem_Ram1_Addr : OUT  std_logic_vector(15 downto 0);
         AddrMem_Ram1_Data : INOUT  std_logic_vector(15 downto 0);
         AddrMem_Ram1_OE : OUT  std_logic;
         AddrMem_Ram1_WE : OUT  std_logic;
         AddrMem_Ram1_EN : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal AddrMem_CLK : std_logic := '0';
   signal AddrMem_PC : std_logic_vector(15 downto 0) := (others => '0');
   signal AddrMem_EN : std_logic := '0';

	--BiDirs
   signal AddrMem_Ram1_Data : std_logic_vector(15 downto 0);

 	--Outputs
   signal AddrMem_Ins_OUT : std_logic_vector(15 downto 0);
   signal AddrMem_Ram1_Addr : std_logic_vector(15 downto 0);
   signal AddrMem_Ram1_OE : std_logic;
   signal AddrMem_Ram1_WE : std_logic;
   signal AddrMem_Ram1_EN : std_logic;


    COMPONENT BrhUnit
    PORT(
         BrhUnit_Brh : IN  std_logic_vector(1 downto 0);
         BrhUnit_Jmp : IN  std_logic;
         BrhUnit_RsVal : IN  std_logic_vector(15 downto 0);
         BrhUnit_RtVal : IN  std_logic_vector(15 downto 0);
         BrhUnit_Imm : IN  std_logic_vector(15 downto 0);
         BrhUnit_PC : IN  std_logic_vector(15 downto 0);
         BrhUnit_JmpPC : OUT  std_logic_vector(15 downto 0);
         BrhUnit_PCSel : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal BrhUnit_Brh : std_logic_vector(1 downto 0) := (others => '0');
   signal BrhUnit_Jmp : std_logic := '0';
   signal BrhUnit_RsVal : std_logic_vector(15 downto 0) := (others => '0');
   signal BrhUnit_RtVal : std_logic_vector(15 downto 0) := (others => '0');
   signal BrhUnit_Imm : std_logic_vector(15 downto 0) := (others => '0');
   signal BrhUnit_PC : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal BrhUnit_JmpPC : std_logic_vector(15 downto 0);
   signal BrhUnit_PCSel : std_logic;

    COMPONENT DataMem
    PORT(
         DataMem_CLK : IN  std_logic;
         DataMem_Addr : IN  std_logic_vector(15 downto 0);
         DataMem_RE : IN  std_logic;
         DataMem_WE : IN  std_logic;
         DataMem_EN : IN  std_logic;
         DataMem_Val_IN : IN  std_logic_vector(15 downto 0);
         DataMem_Val_OUT : OUT  std_logic_vector(15 downto 0);
         DataMem_Stop_EN : OUT  std_logic;
         DataMem_Ram1_Addr : OUT  std_logic_vector(15 downto 0);
         DataMem_Ram1_Data : INOUT  std_logic_vector(15 downto 0);
         DataMem_Ram1_OE : OUT  std_logic;
         DataMem_Ram1_WE : OUT  std_logic;
         DataMem_Ram1_EN : OUT  std_logic;
         DataMem_Ram2_Addr : OUT  std_logic_vector(15 downto 0);
         DataMem_Ram2_Data : INOUT  std_logic_vector(15 downto 0);
         DataMem_Ram2_OE : OUT  std_logic;
         DataMem_Ram2_WE : OUT  std_logic;
         DataMem_Ram2_EN : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal DataMem_CLK : std_logic := '0';
   signal DataMem_Addr : std_logic_vector(15 downto 0) := (others => '0');
   signal DataMem_RE : std_logic := '0';
   signal DataMem_WE : std_logic := '0';
   signal DataMem_EN : std_logic := '0';
   signal DataMem_Val_IN : std_logic_vector(15 downto 0) := (others => '0');

	--BiDirs
   signal DataMem_Ram1_Data : std_logic_vector(15 downto 0);
   signal DataMem_Ram2_Data : std_logic_vector(15 downto 0);

 	--Outputs
   signal DataMem_Val_OUT : std_logic_vector(15 downto 0);
   signal DataMem_Stop_EN : std_logic;
   signal DataMem_Ram1_Addr : std_logic_vector(15 downto 0);
   signal DataMem_Ram1_OE : std_logic;
   signal DataMem_Ram1_WE : std_logic;
   signal DataMem_Ram1_EN : std_logic;
   signal DataMem_Ram2_Addr : std_logic_vector(15 downto 0);
   signal DataMem_Ram2_OE : std_logic;
   signal DataMem_Ram2_WE : std_logic;
   signal DataMem_Ram2_EN : std_logic;

    COMPONENT ExToMem
    PORT(
         CLK : IN  std_logic;
         ExToMem_En : IN  std_logic;
         ExToMem_Reset : IN  std_logic;
         ExToMem_PC_IN : IN  std_logic_vector(15 downto 0);
         ExToMem_RegMemSel_IN : IN  std_logic;
         ExToMem_RegWr_IN : IN  std_logic;
         ExToMem_MemRE_IN : IN  std_logic;
         ExToMem_MemWE_IN : IN  std_logic;
         ExToMem_MemVal_IN : IN  std_logic_vector(15 downto 0);
         ExToMem_MemAddr_IN : IN  std_logic_vector(15 downto 0);
         ExToMem_RegNum_IN : IN  std_logic_vector(3 downto 0);
         ExToMem_PC_OUT : OUT  std_logic_vector(15 downto 0);
         ExToMem_RegMemSel_OUT : OUT  std_logic;
         ExToMem_RegWr_OUT : OUT  std_logic;
         ExToMem_MemRE_OUT : OUT  std_logic;
         ExToMem_MemWE_OUT : OUT  std_logic;
         ExToMem_MemVal_OUT : OUT  std_logic_vector(15 downto 0);
         ExToMem_MemAddr_OUT : OUT  std_logic_vector(15 downto 0);
         ExToMem_RegNum_OUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal ExToMem_En : std_logic := '0';
   signal ExToMem_Reset : std_logic := '0';
   signal ExToMem_PC_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal ExToMem_RegMemSel_IN : std_logic := '0';
   signal ExToMem_RegWr_IN : std_logic := '0';
   signal ExToMem_MemRE_IN : std_logic := '0';
   signal ExToMem_MemWE_IN : std_logic := '0';
   signal ExToMem_MemVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal ExToMem_MemAddr_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal ExToMem_RegNum_IN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ExToMem_PC_OUT : std_logic_vector(15 downto 0);
   signal ExToMem_RegMemSel_OUT : std_logic;
   signal ExToMem_RegWr_OUT : std_logic;
   signal ExToMem_MemRE_OUT : std_logic;
   signal ExToMem_MemWE_OUT : std_logic;
   signal ExToMem_MemVal_OUT : std_logic_vector(15 downto 0);
   signal ExToMem_MemAddr_OUT : std_logic_vector(15 downto 0);
   signal ExToMem_RegNum_OUT : std_logic_vector(3 downto 0);

    COMPONENT FwdUnit
    PORT(
         FwdUnit_Ex_Rs : IN  std_logic_vector(3 downto 0);
         FwdUnit_Ex_Rt : IN  std_logic_vector(3 downto 0);
         FwdUnit_ExToMem_RegWr : IN  std_logic;
         FwdUnit_ExToMem_RegNum : IN  std_logic_vector(3 downto 0);
         FwdUnit_MemToWr_RegMemSel : IN  std_logic;
         FwdUnit_MemToWr_RegWr : IN  std_logic;
         FwdUnit_MemToWr_RegNum : IN  std_logic_vector(3 downto 0);
         FwdUnit_FwdRsSel : OUT  std_logic_vector(1 downto 0);
         FwdUnit_FwdRtSel : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal FwdUnit_Ex_Rs : std_logic_vector(3 downto 0) := (others => '0');
   signal FwdUnit_Ex_Rt : std_logic_vector(3 downto 0) := (others => '0');
   signal FwdUnit_ExToMem_RegWr : std_logic := '0';
   signal FwdUnit_ExToMem_RegNum : std_logic_vector(3 downto 0) := (others => '0');
   signal FwdUnit_MemToWr_RegMemSel : std_logic := '0';
   signal FwdUnit_MemToWr_RegWr : std_logic := '0';
   signal FwdUnit_MemToWr_RegNum : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal FwdUnit_FwdRsSel : std_logic_vector(1 downto 0);
   signal FwdUnit_FwdRtSel : std_logic_vector(1 downto 0);

    COMPONENT IdToEx
    PORT(
         CLK : IN  std_logic;
         IdToEx_En : IN  std_logic;
         IdToEx_Reset : IN  std_logic;
         IdToEx_PC_IN : IN  std_logic_vector(15 downto 0);
         IdToEx_RegMemSel_IN : IN  std_logic;
         IdToEx_RegWr_IN : IN  std_logic;
         IdToEx_SignExt_IN : IN  std_logic;
         IdToEx_Width_IN : IN  std_logic_vector(1 downto 0);
         IdToEx_MemRE_IN : IN  std_logic;
         IdToEx_MemWE_IN : IN  std_logic;
         IdToEx_ALUOp_IN : IN  std_logic_vector(2 downto 0);
         IdToEx_ALUOr_IN : IN  std_logic;
         IdToEx_RtRegImmSel_IN : IN  std_logic;
         IdToEx_RsRegImmSel_IN : IN  std_logic;
         IdToEx_RsRtRdSel_IN : IN  std_logic_vector(1 downto 0);
         IdToEx_DiRsRtSel_IN : IN  std_logic;
         IdToEx_Brh_IN : IN  std_logic_vector(1 downto 0);
         IdToEx_Jmp_IN : IN  std_logic;
         IdToEx_Rs_IN : IN  std_logic_vector(3 downto 0);
         IdToEx_Rt_IN : IN  std_logic_vector(3 downto 0);
         IdToEx_Rd_IN : IN  std_logic_vector(3 downto 0);
         IdToEx_Imm_IN : IN  std_logic_vector(15 downto 0);
         IdToEx_RsVal_IN : IN  std_logic_vector(15 downto 0);
         IdToEx_RtVal_IN : IN  std_logic_vector(15 downto 0);
         IdToEx_PC_OUT : OUT  std_logic_vector(15 downto 0);
         IdToEx_RegMemSel_OUT : OUT  std_logic;
         IdToEx_RegWr_OUT : OUT  std_logic;
         IdToEx_SignExt_OUT : OUT  std_logic;
         IdToEx_Width_OUT : OUT  std_logic_vector(1 downto 0);
         IdToEx_MemRE_OUT : OUT  std_logic;
         IdToEx_MemWE_OUT : OUT  std_logic;
         IdToEx_ALUOp_OUT : OUT  std_logic_vector(2 downto 0);
         IdToEx_ALUOr_OUT : OUT  std_logic;
         IdToEx_RtRegImmSel_OUT : OUT  std_logic;
         IdToEx_RsRegImmSel_OUT : OUT  std_logic;
         IdToEx_RsRtRdSel_OUT : OUT  std_logic_vector(1 downto 0);
         IdToEx_DiRsRtSel_OUT : OUT  std_logic;
         IdToEx_Brh_OUT : OUT  std_logic_vector(1 downto 0);
         IdToEx_Jmp_OUT : OUT  std_logic;
         IdToEx_Rs_OUT : OUT  std_logic_vector(3 downto 0);
         IdToEx_Rt_OUT : OUT  std_logic_vector(3 downto 0);
         IdToEx_Rd_OUT : OUT  std_logic_vector(3 downto 0);
         IdToEx_Imm_OUT : OUT  std_logic_vector(15 downto 0);
         IdToEx_RsVal_OUT : OUT  std_logic_vector(15 downto 0);
         IdToEx_RtVal_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal IdToEx_En : std_logic := '0';
   signal IdToEx_Reset : std_logic := '0';
   signal IdToEx_PC_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal IdToEx_RegMemSel_IN : std_logic := '0';
   signal IdToEx_RegWr_IN : std_logic := '0';
   signal IdToEx_SignExt_IN : std_logic := '0';
   signal IdToEx_Width_IN : std_logic_vector(1 downto 0) := (others => '0');
   signal IdToEx_MemRE_IN : std_logic := '0';
   signal IdToEx_MemWE_IN : std_logic := '0';
   signal IdToEx_ALUOp_IN : std_logic_vector(2 downto 0) := (others => '0');
   signal IdToEx_ALUOr_IN : std_logic := '0';
   signal IdToEx_RtRegImmSel_IN : std_logic := '0';
   signal IdToEx_RsRegImmSel_IN : std_logic := '0';
   signal IdToEx_RsRtRdSel_IN : std_logic_vector(1 downto 0) := (others => '0');
   signal IdToEx_DiRsRtSel_IN : std_logic := '0';
   signal IdToEx_Brh_IN : std_logic_vector(1 downto 0) := (others => '0');
   signal IdToEx_Jmp_IN : std_logic := '0';
   signal IdToEx_Rs_IN : std_logic_vector(3 downto 0) := (others => '0');
   signal IdToEx_Rt_IN : std_logic_vector(3 downto 0) := (others => '0');
   signal IdToEx_Rd_IN : std_logic_vector(3 downto 0) := (others => '0');
   signal IdToEx_Imm_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal IdToEx_RsVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal IdToEx_RtVal_IN : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal IdToEx_PC_OUT : std_logic_vector(15 downto 0);
   signal IdToEx_RegMemSel_OUT : std_logic;
   signal IdToEx_RegWr_OUT : std_logic;
   signal IdToEx_SignExt_OUT : std_logic;
   signal IdToEx_Width_OUT : std_logic_vector(1 downto 0);
   signal IdToEx_MemRE_OUT : std_logic;
   signal IdToEx_MemWE_OUT : std_logic;
   signal IdToEx_ALUOp_OUT : std_logic_vector(2 downto 0);
   signal IdToEx_ALUOr_OUT : std_logic;
   signal IdToEx_RtRegImmSel_OUT : std_logic;
   signal IdToEx_RsRegImmSel_OUT : std_logic;
   signal IdToEx_RsRtRdSel_OUT : std_logic_vector(1 downto 0);
   signal IdToEx_DiRsRtSel_OUT : std_logic;
   signal IdToEx_Brh_OUT : std_logic_vector(1 downto 0);
   signal IdToEx_Jmp_OUT : std_logic;
   signal IdToEx_Rs_OUT : std_logic_vector(3 downto 0);
   signal IdToEx_Rt_OUT : std_logic_vector(3 downto 0);
   signal IdToEx_Rd_OUT : std_logic_vector(3 downto 0);
   signal IdToEx_Imm_OUT : std_logic_vector(15 downto 0);
   signal IdToEx_RsVal_OUT : std_logic_vector(15 downto 0);
   signal IdToEx_RtVal_OUT : std_logic_vector(15 downto 0);

    COMPONENT IfToId
    PORT(
         CLK : IN  std_logic;
         IfToId_En : IN  std_logic;
         IfToId_Reset : IN  std_logic;
         IfToId_PC_IN : IN  std_logic_vector(15 downto 0);
         IfToId_Ins_IN : IN  std_logic_vector(15 downto 0);
         IfToId_PC_OUT : OUT  std_logic_vector(15 downto 0);
         IfToId_Ins_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal IfToId_En : std_logic := '0';
   signal IfToId_Reset : std_logic := '0';
   signal IfToId_PC_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal IfToId_Ins_IN : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal IfToId_PC_OUT : std_logic_vector(15 downto 0);
   signal IfToId_Ins_OUT : std_logic_vector(15 downto 0);

    COMPONENT ImmTrans
    PORT(
         ImmTrans_Imm_IN : IN  std_logic_vector(15 downto 0);
         ImmTrans_SignExt : IN  std_logic;
         ImmTrans_Width : IN  std_logic_vector(1 downto 0);
         ImmTrans_Imm_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal ImmTrans_Imm_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal ImmTrans_SignExt : std_logic := '0';
   signal ImmTrans_Width : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal ImmTrans_Imm_OUT : std_logic_vector(15 downto 0);

    COMPONENT LoadUse
    PORT(
         LoadUse_Id_Rs : IN  std_logic_vector(3 downto 0);
         LoadUse_Id_Rt : IN  std_logic_vector(3 downto 0);
         LoadUse_Ex_RegNum : IN  std_logic_vector(3 downto 0);
         LoadUse_Ex_MemRE : IN  std_logic;
         LoadUse_En : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal LoadUse_Id_Rs : std_logic_vector(3 downto 0) := (others => '0');
   signal LoadUse_Id_Rt : std_logic_vector(3 downto 0) := (others => '0');
   signal LoadUse_Ex_RegNum : std_logic_vector(3 downto 0) := (others => '0');
   signal LoadUse_Ex_MemRE : std_logic := '0';

 	--Outputss
   signal LoadUse_En : std_logic;
    COMPONENT MainCtrl
    PORT(
         MainCtrl_Ins : IN  std_logic_vector(15 downto 0);
         MainCtrl_RsZero : OUT  std_logic;
         MainCtrl_RtZero : OUT  std_logic;
         MainCtrl_RsDedEn : OUT  std_logic;
         MainCtrl_RsDedSel : OUT  std_logic_vector(1 downto 0);
         MainCtrl_RtDedEn : OUT  std_logic;
         MainCtrl_RtDedSel : OUT  std_logic_vector(1 downto 0);
         MainCtrl_RegMemSel : OUT  std_logic;
         MainCtrl_RegWr : OUT  std_logic;
         MainCtrl_SignExt : OUT  std_logic;
         MainCtrl_Width : OUT  std_logic_vector(1 downto 0);
         MainCtrl_MemRE : OUT  std_logic;
         MainCtrl_MemWE : OUT  std_logic;
         MainCtrl_ALUOp : OUT  std_logic_vector(2 downto 0);
         MainCtrl_ALUOr : OUT  std_logic;
         MainCtrl_RtRegImmSel : OUT  std_logic;
         MainCtrl_RsRegImmSel : OUT  std_logic;
         MainCtrl_RsRtRdSel : OUT  std_logic_vector(1 downto 0);
         MainCtrl_DiRsRtSel : OUT  std_logic;
         MainCtrl_Brh : OUT  std_logic_vector(1 downto 0);
         MainCtrl_Jmp : OUT  std_logic;
         MainCtrl_Rs : OUT  std_logic_vector(3 downto 0);
         MainCtrl_Rt : OUT  std_logic_vector(3 downto 0);
         MainCtrl_Rd : OUT  std_logic_vector(3 downto 0);
         MainCtrl_Imm : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal MainCtrl_Ins : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal MainCtrl_RsZero : std_logic;
   signal MainCtrl_RtZero : std_logic;
   signal MainCtrl_RsDedEn : std_logic;
   signal MainCtrl_RsDedSel : std_logic_vector(1 downto 0);
   signal MainCtrl_RtDedEn : std_logic;
   signal MainCtrl_RtDedSel : std_logic_vector(1 downto 0);
   signal MainCtrl_RegMemSel : std_logic;
   signal MainCtrl_RegWr : std_logic;
   signal MainCtrl_SignExt : std_logic;
   signal MainCtrl_Width : std_logic_vector(1 downto 0);
   signal MainCtrl_MemRE : std_logic;
   signal MainCtrl_MemWE : std_logic;
   signal MainCtrl_ALUOp : std_logic_vector(2 downto 0);
   signal MainCtrl_ALUOr : std_logic;
   signal MainCtrl_RtRegImmSel : std_logic;
   signal MainCtrl_RsRegImmSel : std_logic;
   signal MainCtrl_RsRtRdSel : std_logic_vector(1 downto 0);
   signal MainCtrl_DiRsRtSel : std_logic;
   signal MainCtrl_Brh : std_logic_vector(1 downto 0);
   signal MainCtrl_Jmp : std_logic;
   signal MainCtrl_Rs : std_logic_vector(3 downto 0);
   signal MainCtrl_Rt : std_logic_vector(3 downto 0);
   signal MainCtrl_Rd : std_logic_vector(3 downto 0);
   signal MainCtrl_Imm : std_logic_vector(15 downto 0);

    COMPONENT MemToWr
    PORT(
         CLK : IN  std_logic;
         MemToWr_En : IN  std_logic;
         MemToWr_Reset : IN  std_logic;
         MemToWr_RegMemSel_IN : IN  std_logic;
         MemToWr_RegWr_IN : IN  std_logic;
         MemToWr_MemVal_IN : IN  std_logic_vector(15 downto 0);
         MemToWr_RegVal_IN : IN  std_logic_vector(15 downto 0);
         MemToWr_RegNum_IN : IN  std_logic_vector(3 downto 0);
         MemToWr_RegMemSel_OUT : OUT  std_logic;
         MemToWr_RegWr_OUT : OUT  std_logic;
         MemToWr_MemVal_OUT : OUT  std_logic_vector(15 downto 0);
         MemToWr_RegVal_OUT : OUT  std_logic_vector(15 downto 0);
         MemToWr_RegNum_OUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal MemToWr_En : std_logic := '0';
   signal MemToWr_Reset : std_logic := '0';
   signal MemToWr_RegMemSel_IN : std_logic := '0';
   signal MemToWr_RegWr_IN : std_logic := '0';
   signal MemToWr_MemVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal MemToWr_RegVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal MemToWr_RegNum_IN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal MemToWr_RegMemSel_OUT : std_logic;
   signal MemToWr_RegWr_OUT : std_logic;
   signal MemToWr_MemVal_OUT : std_logic_vector(15 downto 0);
   signal MemToWr_RegVal_OUT : std_logic_vector(15 downto 0);
   signal MemToWr_RegNum_OUT : std_logic_vector(3 downto 0);

    COMPONENT Mux2
    PORT(
         Mux2_0 : IN  std_logic_vector(15 downto 0);
         Mux2_1 : IN  std_logic_vector(15 downto 0);
         Mux2_Sel : IN  std_logic;
         Mux2_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal Mux2_0 : std_logic_vector(15 downto 0) := (others => '0');
   signal Mux2_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Mux2_Sel : std_logic := '0';

 	--Outputs
   signal Mux2_OUT : std_logic_vector(15 downto 0);

    COMPONENT Mux4
    PORT(
         Mux4_00 : IN  std_logic_vector(15 downto 0);
         Mux4_01 : IN  std_logic_vector(15 downto 0);
         Mux4_10 : IN  std_logic_vector(15 downto 0);
         Mux4_11 : IN  std_logic_vector(15 downto 0);
         Mux4_Sel : IN  std_logic_vector(1 downto 0);
         Mux4_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal Mux4_00 : std_logic_vector(15 downto 0) := (others => '0');
   signal Mux4_01 : std_logic_vector(15 downto 0) := (others => '0');
   signal Mux4_10 : std_logic_vector(15 downto 0) := (others => '0');
   signal Mux4_11 : std_logic_vector(15 downto 0) := (others => '0');
   signal Mux4_Sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Mux4_OUT : std_logic_vector(15 downto 0);

    COMPONENT PCSel
    PORT(
         CLK : IN  std_logic;
         PC_En : IN  std_logic;
         PC_Reset : IN  std_logic;
         PC_Sel : IN  std_logic;
         PC_JmpPC_IN : IN  std_logic_vector(15 downto 0);
         PC_NextPC_IN : IN  std_logic_vector(15 downto 0);
         PC_NextPC_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal PC_En : std_logic := '0';
   signal PC_Reset : std_logic := '0';
   signal PC_Sel : std_logic := '0';
   signal PC_JmpPC_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal PC_NextPC_IN : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal PC_NextPC_OUT : std_logic_vector(15 downto 0);

    COMPONENT RegFile
    PORT(
         RegFile_CLK : IN  std_logic;
         RegFile_WE : IN  std_logic;
         RegFile_Rs : IN  std_logic_vector(2 downto 0);
         RegFile_Rt : IN  std_logic_vector(2 downto 0);
         RegFile_RegNum : IN  std_logic_vector(3 downto 0);
         RegFile_RegVal : IN  std_logic_vector(15 downto 0);
         RegFile_RsVal : OUT  std_logic_vector(15 downto 0);
         RegFile_RtVal : OUT  std_logic_vector(15 downto 0);
         SP_OUT : OUT  std_logic_vector(15 downto 0);
         IH_OUT : OUT  std_logic_vector(15 downto 0);
         RA_OUT : OUT  std_logic_vector(15 downto 0);
         T_OUt : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal RegFile_CLK : std_logic := '0';
   signal RegFile_WE : std_logic := '0';
   signal RegFile_Rs : std_logic_vector(2 downto 0) := (others => '0');
   signal RegFile_Rt : std_logic_vector(2 downto 0) := (others => '0');
   signal RegFile_RegNum : std_logic_vector(3 downto 0) := (others => '0');
   signal RegFile_RegVal : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal RegFile_RsVal : std_logic_vector(15 downto 0);
   signal RegFile_RtVal : std_logic_vector(15 downto 0);
   signal SP_OUT : std_logic_vector(15 downto 0);
   signal IH_OUT : std_logic_vector(15 downto 0);
   signal RA_OUT : std_logic_vector(15 downto 0);
   signal T_OUt : std_logic_vector(15 downto 0);

    COMPONENT RegFile
    PORT(
         RegFile_CLK : IN  std_logic;
         RegFile_WE : IN  std_logic;
         RegFile_Rs : IN  std_logic_vector(2 downto 0);
         RegFile_Rt : IN  std_logic_vector(2 downto 0);
         RegFile_RegNum : IN  std_logic_vector(3 downto 0);
         RegFile_RegVal : IN  std_logic_vector(15 downto 0);
         RegFile_RsVal : OUT  std_logic_vector(15 downto 0);
         RegFile_RtVal : OUT  std_logic_vector(15 downto 0);
         SP_OUT : OUT  std_logic_vector(15 downto 0);
         IH_OUT : OUT  std_logic_vector(15 downto 0);
         RA_OUT : OUT  std_logic_vector(15 downto 0);
         T_OUt : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal RegFile_CLK : std_logic := '0';
   signal RegFile_WE : std_logic := '0';
   signal RegFile_Rs : std_logic_vector(2 downto 0) := (others => '0');
   signal RegFile_Rt : std_logic_vector(2 downto 0) := (others => '0');
   signal RegFile_RegNum : std_logic_vector(3 downto 0) := (others => '0');
   signal RegFile_RegVal : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal RegFile_RsVal : std_logic_vector(15 downto 0);
   signal RegFile_RtVal : std_logic_vector(15 downto 0);
   signal SP_OUT : std_logic_vector(15 downto 0);
   signal IH_OUT : std_logic_vector(15 downto 0);
   signal RA_OUT : std_logic_vector(15 downto 0);
   signal T_OUt : std_logic_vector(15 downto 0);
   
   
    COMPONENT RegSelUnit
    PORT(
         RegSelUnit_RsZero : IN  std_logic;
         RegSelUnit_RtZero : IN  std_logic;
         RegSelUnit_RsDedEn : IN  std_logic;
         RegSelUnit_RsDedSel : IN  std_logic_vector(1 downto 0);
         RegSelUnit_RtDedEn : IN  std_logic;
         RegSelUnit_RtDedSel : IN  std_logic_vector(1 downto 0);
         RegSelUnit_RsVal_IN : IN  std_logic_vector(15 downto 0);
         RegSelUnit_RtVal_IN : IN  std_logic_vector(15 downto 0);
         RegSelUnit_SPVal_IN : IN  std_logic_vector(15 downto 0);
         RegSelUnit_IHVal_IN : IN  std_logic_vector(15 downto 0);
         RegSelUnit_RAVal_IN : IN  std_logic_vector(15 downto 0);
         RegSelUnit_TVal_IN : IN  std_logic_vector(15 downto 0);
         RegSelUnit_RsVal_OUT : OUT  std_logic_vector(15 downto 0);
         RegSelUnit_RtVal_OUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RegSelUnit_RsZero : std_logic := '0';
   signal RegSelUnit_RtZero : std_logic := '0';
   signal RegSelUnit_RsDedEn : std_logic := '0';
   signal RegSelUnit_RsDedSel : std_logic_vector(1 downto 0) := (others => '0');
   signal RegSelUnit_RtDedEn : std_logic := '0';
   signal RegSelUnit_RtDedSel : std_logic_vector(1 downto 0) := (others => '0');
   signal RegSelUnit_RsVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal RegSelUnit_RtVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal RegSelUnit_SPVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal RegSelUnit_IHVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal RegSelUnit_RAVal_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal RegSelUnit_TVal_IN : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal RegSelUnit_RsVal_OUT : std_logic_vector(15 downto 0);
   signal RegSelUnit_RtVal_OUT : std_logic_vector(15 downto 0);










begin


   uut_ALU: ALU PORT MAP (
          ALU_ALUOp => ALU_ALUOp,
          ALU_ALUOr => ALU_ALUOr,
          ALU_RsVal => ALU_RsVal,
          ALU_RtVal => ALU_RtVal,
          ALU_OUT => ALU_OUT
        );

   uut_Adder: Adder PORT MAP (
          Val_IN => Val_IN,
          Val_OUT => Val_OUT
        );

   uut_AddrMem: AddrMem PORT MAP (
          CLK => CLK,
          AddrMem_PC => AddrMem_PC,
          AddrMem_EN => AddrMem_EN,
          AddrMem_Ins_OUT => AddrMem_Ins_OUT,
          AddrMem_Ram1_Addr => AddrMem_Ram1_Addr,
          AddrMem_Ram1_Data => AddrMem_Ram1_Data,
          AddrMem_Ram1_OE => AddrMem_Ram1_OE,
          AddrMem_Ram1_WE => AddrMem_Ram1_WE,
          AddrMem_Ram1_EN => AddrMem_Ram1_EN
        );

   uut_BrhUnit: BrhUnit PORT MAP (
          BrhUnit_Brh => BrhUnit_Brh,
          BrhUnit_Jmp => BrhUnit_Jmp,
          BrhUnit_RsVal => BrhUnit_RsVal,
          BrhUnit_RtVal => BrhUnit_RtVal,
          BrhUnit_Imm => BrhUnit_Imm,
          BrhUnit_PC => BrhUnit_PC,
          BrhUnit_JmpPC => BrhUnit_JmpPC,
          BrhUnit_PCSel => BrhUnit_PCSel
        );

   uut_DataMem: DataMem PORT MAP (
          CLK => CLK,
          DataMem_Addr => DataMem_Addr,
          DataMem_RE => DataMem_RE,
          DataMem_WE => DataMem_WE,
          DataMem_EN => DataMem_EN,
          DataMem_Val_IN => DataMem_Val_IN,
          DataMem_Val_OUT => DataMem_Val_OUT,
          DataMem_Stop_EN => DataMem_Stop_EN,
          DataMem_Ram1_Addr => DataMem_Ram1_Addr,
          DataMem_Ram1_Data => DataMem_Ram1_Data,
          DataMem_Ram1_OE => DataMem_Ram1_OE,
          DataMem_Ram1_WE => DataMem_Ram1_WE,
          DataMem_Ram1_EN => DataMem_Ram1_EN,
          DataMem_Ram2_Addr => DataMem_Ram2_Addr,
          DataMem_Ram2_Data => DataMem_Ram2_Data,
          DataMem_Ram2_OE => DataMem_Ram2_OE,
          DataMem_Ram2_WE => DataMem_Ram2_WE,
          DataMem_Ram2_EN => DataMem_Ram2_EN
        );

   uut_ExToMem: ExToMem PORT MAP (
          CLK => CLK,
          ExToMem_En => ExToMem_En,
          ExToMem_Reset => ExToMem_Reset,
          ExToMem_PC_IN => ExToMem_PC_IN,
          ExToMem_RegMemSel_IN => ExToMem_RegMemSel_IN,
          ExToMem_RegWr_IN => ExToMem_RegWr_IN,
          ExToMem_MemRE_IN => ExToMem_MemRE_IN,
          ExToMem_MemWE_IN => ExToMem_MemWE_IN,
          ExToMem_MemVal_IN => ExToMem_MemVal_IN,
          ExToMem_MemAddr_IN => ExToMem_MemAddr_IN,
          ExToMem_RegNum_IN => ExToMem_RegNum_IN,
          ExToMem_PC_OUT => ExToMem_PC_OUT,
          ExToMem_RegMemSel_OUT => ExToMem_RegMemSel_OUT,
          ExToMem_RegWr_OUT => ExToMem_RegWr_OUT,
          ExToMem_MemRE_OUT => ExToMem_MemRE_OUT,
          ExToMem_MemWE_OUT => ExToMem_MemWE_OUT,
          ExToMem_MemVal_OUT => ExToMem_MemVal_OUT,
          ExToMem_MemAddr_OUT => ExToMem_MemAddr_OUT,
          ExToMem_RegNum_OUT => ExToMem_RegNum_OUT
        );

   uut_FwdUnit: FwdUnit PORT MAP (
          FwdUnit_Ex_Rs => FwdUnit_Ex_Rs,
          FwdUnit_Ex_Rt => FwdUnit_Ex_Rt,
          FwdUnit_ExToMem_RegWr => FwdUnit_ExToMem_RegWr,
          FwdUnit_ExToMem_RegNum => FwdUnit_ExToMem_RegNum,
          FwdUnit_MemToWr_RegMemSel => FwdUnit_MemToWr_RegMemSel,
          FwdUnit_MemToWr_RegWr => FwdUnit_MemToWr_RegWr,
          FwdUnit_MemToWr_RegNum => FwdUnit_MemToWr_RegNum,
          FwdUnit_FwdRsSel => FwdUnit_FwdRsSel,
          FwdUnit_FwdRtSel => FwdUnit_FwdRtSel
        );

   uut_IdToEx: IdToEx PORT MAP (
          CLK => CLK,
          IdToEx_En => IdToEx_En,
          IdToEx_Reset => IdToEx_Reset,
          IdToEx_PC_IN => IdToEx_PC_IN,
          IdToEx_RegMemSel_IN => IdToEx_RegMemSel_IN,
          IdToEx_RegWr_IN => IdToEx_RegWr_IN,
          IdToEx_SignExt_IN => IdToEx_SignExt_IN,
          IdToEx_Width_IN => IdToEx_Width_IN,
          IdToEx_MemRE_IN => IdToEx_MemRE_IN,
          IdToEx_MemWE_IN => IdToEx_MemWE_IN,
          IdToEx_ALUOp_IN => IdToEx_ALUOp_IN,
          IdToEx_ALUOr_IN => IdToEx_ALUOr_IN,
          IdToEx_RtRegImmSel_IN => IdToEx_RtRegImmSel_IN,
          IdToEx_RsRegImmSel_IN => IdToEx_RsRegImmSel_IN,
          IdToEx_RsRtRdSel_IN => IdToEx_RsRtRdSel_IN,
          IdToEx_DiRsRtSel_IN => IdToEx_DiRsRtSel_IN,
          IdToEx_Brh_IN => IdToEx_Brh_IN,
          IdToEx_Jmp_IN => IdToEx_Jmp_IN,
          IdToEx_Rs_IN => IdToEx_Rs_IN,
          IdToEx_Rt_IN => IdToEx_Rt_IN,
          IdToEx_Rd_IN => IdToEx_Rd_IN,
          IdToEx_Imm_IN => IdToEx_Imm_IN,
          IdToEx_RsVal_IN => IdToEx_RsVal_IN,
          IdToEx_RtVal_IN => IdToEx_RtVal_IN,
          IdToEx_PC_OUT => IdToEx_PC_OUT,
          IdToEx_RegMemSel_OUT => IdToEx_RegMemSel_OUT,
          IdToEx_RegWr_OUT => IdToEx_RegWr_OUT,
          IdToEx_SignExt_OUT => IdToEx_SignExt_OUT,
          IdToEx_Width_OUT => IdToEx_Width_OUT,
          IdToEx_MemRE_OUT => IdToEx_MemRE_OUT,
          IdToEx_MemWE_OUT => IdToEx_MemWE_OUT,
          IdToEx_ALUOp_OUT => IdToEx_ALUOp_OUT,
          IdToEx_ALUOr_OUT => IdToEx_ALUOr_OUT,
          IdToEx_RtRegImmSel_OUT => IdToEx_RtRegImmSel_OUT,
          IdToEx_RsRegImmSel_OUT => IdToEx_RsRegImmSel_OUT,
          IdToEx_RsRtRdSel_OUT => IdToEx_RsRtRdSel_OUT,
          IdToEx_DiRsRtSel_OUT => IdToEx_DiRsRtSel_OUT,
          IdToEx_Brh_OUT => IdToEx_Brh_OUT,
          IdToEx_Jmp_OUT => IdToEx_Jmp_OUT,
          IdToEx_Rs_OUT => IdToEx_Rs_OUT,
          IdToEx_Rt_OUT => IdToEx_Rt_OUT,
          IdToEx_Rd_OUT => IdToEx_Rd_OUT,
          IdToEx_Imm_OUT => IdToEx_Imm_OUT,
          IdToEx_RsVal_OUT => IdToEx_RsVal_OUT,
          IdToEx_RtVal_OUT => IdToEx_RtVal_OUT
        );

   uut_IfToId: IfToId PORT MAP (
          CLK => CLK,
          IfToId_En => IfToId_En,
          IfToId_Reset => IfToId_Reset,
          IfToId_PC_IN => IfToId_PC_IN,
          IfToId_Ins_IN => IfToId_Ins_IN,
          IfToId_PC_OUT => IfToId_PC_OUT,
          IfToId_Ins_OUT => IfToId_Ins_OUT
        );

   uut_ImmTrans: ImmTrans PORT MAP (
          ImmTrans_Imm_IN => ImmTrans_Imm_IN,
          ImmTrans_SignExt => ImmTrans_SignExt,
          ImmTrans_Width => ImmTrans_Width,
          ImmTrans_Imm_OUT => ImmTrans_Imm_OUT
        );

   uut_LoadUse: LoadUse PORT MAP (
          LoadUse_Id_Rs => LoadUse_Id_Rs,
          LoadUse_Id_Rt => LoadUse_Id_Rt,
          LoadUse_Ex_RegNum => LoadUse_Ex_RegNum,
          LoadUse_Ex_MemRE => LoadUse_Ex_MemRE,
          LoadUse_En => LoadUse_En
        );

   uut_MainCtrl: MainCtrl PORT MAP (
          MainCtrl_Ins => MainCtrl_Ins,
          MainCtrl_RsZero => MainCtrl_RsZero,
          MainCtrl_RtZero => MainCtrl_RtZero,
          MainCtrl_RsDedEn => MainCtrl_RsDedEn,
          MainCtrl_RsDedSel => MainCtrl_RsDedSel,
          MainCtrl_RtDedEn => MainCtrl_RtDedEn,
          MainCtrl_RtDedSel => MainCtrl_RtDedSel,
          MainCtrl_RegMemSel => MainCtrl_RegMemSel,
          MainCtrl_RegWr => MainCtrl_RegWr,
          MainCtrl_SignExt => MainCtrl_SignExt,
          MainCtrl_Width => MainCtrl_Width,
          MainCtrl_MemRE => MainCtrl_MemRE,
          MainCtrl_MemWE => MainCtrl_MemWE,
          MainCtrl_ALUOp => MainCtrl_ALUOp,
          MainCtrl_ALUOr => MainCtrl_ALUOr,
          MainCtrl_RtRegImmSel => MainCtrl_RtRegImmSel,
          MainCtrl_RsRegImmSel => MainCtrl_RsRegImmSel,
          MainCtrl_RsRtRdSel => MainCtrl_RsRtRdSel,
          MainCtrl_DiRsRtSel => MainCtrl_DiRsRtSel,
          MainCtrl_Brh => MainCtrl_Brh,
          MainCtrl_Jmp => MainCtrl_Jmp,
          MainCtrl_Rs => MainCtrl_Rs,
          MainCtrl_Rt => MainCtrl_Rt,
          MainCtrl_Rd => MainCtrl_Rd,
          MainCtrl_Imm => MainCtrl_Imm
        );

   uut_MemToWr: MemToWr PORT MAP (
          CLK => CLK,
          MemToWr_En => MemToWr_En,
          MemToWr_Reset => MemToWr_Reset,
          MemToWr_RegMemSel_IN => MemToWr_RegMemSel_IN,
          MemToWr_RegWr_IN => MemToWr_RegWr_IN,
          MemToWr_MemVal_IN => MemToWr_MemVal_IN,
          MemToWr_RegVal_IN => MemToWr_RegVal_IN,
          MemToWr_RegNum_IN => MemToWr_RegNum_IN,
          MemToWr_RegMemSel_OUT => MemToWr_RegMemSel_OUT,
          MemToWr_RegWr_OUT => MemToWr_RegWr_OUT,
          MemToWr_MemVal_OUT => MemToWr_MemVal_OUT,
          MemToWr_RegVal_OUT => MemToWr_RegVal_OUT,
          MemToWr_RegNum_OUT => MemToWr_RegNum_OUT
        );

   uut_Mux2: Mux2 PORT MAP (
          Mux2_0 => Mux2_0,
          Mux2_1 => Mux2_1,
          Mux2_Sel => Mux2_Sel,
          Mux2_OUT => Mux2_OUT
        );

   uut_Mux4: Mux4 PORT MAP (
          Mux4_00 => Mux4_00,
          Mux4_01 => Mux4_01,
          Mux4_10 => Mux4_10,
          Mux4_11 => Mux4_11,
          Mux4_Sel => Mux4_Sel,
          Mux4_OUT => Mux4_OUT
        );

   uut_PCSel: PCSel PORT MAP (
          CLK => CLK,
          PC_En => PC_En,
          PC_Reset => PC_Reset,
          PC_Sel => PC_Sel,
          PC_JmpPC_IN => PC_JmpPC_IN,
          PC_NextPC_IN => PC_NextPC_IN,
          PC_NextPC_OUT => PC_NextPC_OUT
        );

   uut_RegFile: RegFile PORT MAP (
          CLK => CLK,
          RegFile_WE => RegFile_WE,
          RegFile_Rs => RegFile_Rs,
          RegFile_Rt => RegFile_Rt,
          RegFile_RegNum => RegFile_RegNum,
          RegFile_RegVal => RegFile_RegVal,
          RegFile_RsVal => RegFile_RsVal,
          RegFile_RtVal => RegFile_RtVal,
          SP_OUT => SP_OUT,
          IH_OUT => IH_OUT,
          RA_OUT => RA_OUT,
          T_OUt => T_OUt
        );
        
   uut: RegSelUnit PORT MAP (
          RegSelUnit_RsZero => RegSelUnit_RsZero,
          RegSelUnit_RtZero => RegSelUnit_RtZero,
          RegSelUnit_RsDedEn => RegSelUnit_RsDedEn,
          RegSelUnit_RsDedSel => RegSelUnit_RsDedSel,
          RegSelUnit_RtDedEn => RegSelUnit_RtDedEn,
          RegSelUnit_RtDedSel => RegSelUnit_RtDedSel,
          RegSelUnit_RsVal_IN => RegSelUnit_RsVal_IN,
          RegSelUnit_RtVal_IN => RegSelUnit_RtVal_IN,
          RegSelUnit_SPVal_IN => RegSelUnit_SPVal_IN,
          RegSelUnit_IHVal_IN => RegSelUnit_IHVal_IN,
          RegSelUnit_RAVal_IN => RegSelUnit_RAVal_IN,
          RegSelUnit_TVal_IN => RegSelUnit_TVal_IN,
          RegSelUnit_RsVal_OUT => RegSelUnit_RsVal_OUT,
          RegSelUnit_RtVal_OUT => RegSelUnit_RtVal_OUT
        );

    PCSel_
















end Behavioral;
