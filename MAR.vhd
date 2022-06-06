LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------
ENTITY	MAR	IS
	PORT(		clk_MAR	:	IN		STD_LOGIC;
				rst_MAR	:	IN		STD_LOGIC;
				ena_MAR	:	IN		STD_LOGIC;
				d_MAR	   :	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);	
				q_MAR		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END MAR;
-----------------------------------------
ARCHITECTURE rtl OF	MAR	IS
	
	CONSTANT MAX_WITH_MAR : INTEGER := 8;

BEGIN

MAR:	ENTITY WORK.My_Reg
		GENERIC MAP(MAX_WITH => MAX_WITH_MAR)
			 
		PORT MAP(	clk	=>	clk_MAR,
						rst	=> rst_MAR,
						ena	=>	ena_MAR,
						d		=>	d_MAR,
						q		=> q_MAR);
	
	
END ARCHITECTURE;	