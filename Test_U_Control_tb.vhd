LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;

ENTITY	Test_U_Control_tb	IS
END Test_U_Control_tb;

ARCHITECTURE testbench OF	Test_U_Control_tb	IS

	CONSTANT MAX_WITH_tb			: 	INTEGER := 8;
	SIGNAL 	CLK_tb				:	STD_LOGIC := '1';
	SIGNAL 	RST_tb				:	STD_LOGIC := '0';
	

	--IR-----------------------------------------------------
	SIGNAL	Z_t			:	STD_LOGIC := '0';
	SIGNAL	N_t			:	STD_LOGIC := '0';
	SIGNAL	C_t			:	STD_LOGIC := '0';
	SIGNAL	P_t			:	STD_LOGIC := '0';
	
	SIGNAL	int_t			:	STD_LOGIC := '0';
	
	
	
	--MAR----------------------------------------------------
	SIGNAL	opcode_tb	:	STD_LOGIC_VECTOR(4 DOWNTO 0);	
	
	
	
	--uC----------------------------------------------------
	SIGNAL 	UI_U_t			:	STD_LOGIC_VECTOR(20 DOWNTO 0);
	
BEGIN
	--Clock--
	CLK_tb <= NOT CLK_tb AFTER 10ns;	--50MHz
	
	
	RST_tb <= '1' AFTER 30ns,
				 '0' AFTER 40ns;
				 
-----------------------------------------------------
---				INSTRUCCIONES						     ---
-------------------------------------------------------	
			opcode_tb		<=	"00000"	AFTER 	100ns, --Fetch
									"00001"  AFTER    200ns, --MOV ACC,A
									"00010" 	AFTER		300ns, --MOV A,ACC
									"00101"	AFTER		400ns, --MOV DPTR,ACC
									"01001" 	AFTER		500ns, --ADD ACC,A
									"00111"	AFTER		600ns;--INV ACC
									
			

	DUT:	ENTITY WORK.microcontrol
			PORT MAP(
							CLK			=>		CLK_tb,
							RST			=>		RST_tb,
							Z				=>		Z_t,	
							N				=>		N_t,	
							C				=>		C_t,
							P				=>		P_t,							
							int			=>		int_t,
				
							opcode		=>		opcode_tb,
							
							
							UI_U			=>		UI_U_t
			);
				 
END ARCHITECTURE;