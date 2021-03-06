LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;

ENTITY	Test_U_PDUA_tb	IS
END Test_U_PDUA_tb;

ARCHITECTURE testbench OF	Test_U_PDUA_tb	IS

	
	SIGNAL 	CLK_tb			:	STD_LOGIC := '1';
	
	
	SIGNAL 	RST_tb			:	STD_LOGIC := '1';
	
	
	SIGNAL	INT_tb			:	STD_LOGIC := '0';
		
	
	
BEGIN
	--Clock--
	CLK_tb <= NOT CLK_tb AFTER 10ns;	--50MHz
	
		RST_tb <= '0' AFTER 10ns;
				
							
			

	DUT:	ENTITY WORK.PDUA
			PORT MAP(
							CLK			=>		CLK_tb,
							
							RST			=>		RST_tb,
							
							
							INT			=>		INT_tb
			);
				 
END ARCHITECTURE;