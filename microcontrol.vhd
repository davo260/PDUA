LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;

ENTITY microcontrol IS
	PORT(	CLK					:	IN		STD_LOGIC;
			RST					:	IN		STD_LOGIC;
			
			C						:	IN		STD_LOGIC;
			N						:	IN		STD_LOGIC;
		   Z						:	IN		STD_LOGIC;	
			P						:	IN		STD_LOGIC;							
			int					:	IN		STD_LOGIC;

			opcode				:	IN		STD_LOGIC_VECTOR(4 DOWNTO 0);	
			
			UI_U					:	OUT	STD_LOGIC_VECTOR(20 DOWNTO 0)	
			);
END microcontrol;

ARCHITECTURE rtl OF	microcontrol	IS
	
	SIGNAL result	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	SIGNAL q_uPC	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL d_uPC	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	SIGNAL load		:	STD_LOGIC;
	
	SIGNAL offset	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL jcond	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL en_uPC	:	STD_LOGIC;
	SIGNAL clr_uPC	:	STD_LOGIC;
	
	SIGNAL UI_AUX		:	STD_LOGIC_VECTOR(28 DOWNTO 0);
	
	SIGNAL uaddr_aux	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	
BEGIN
	
	WITH jcond SELECT 
							load <=	'0'	WHEN "000",
										'1' 	WHEN "001",
										Z 		WHEN "010",
										N 		WHEN "011",
										C 		WHEN "100",
										P 		WHEN "101",
										int 	WHEN "110",
									   '0' 	WHEN "111",
										'0'	WHEN OTHERS;
									  
									  
	WITH load SELECT 
							d_uPC <=	result	WHEN '0',
									   offset 	WHEN '1',
										"000"		WHEN OTHERS;
									  								
	
	AplusB: ENTITY WORK.add_sub
	GENERIC MAP(N	=>	3)
	PORT	  MAP(
					a			=>	q_uPC,
					b			=>	"001",
					addn_sub	=>	'0',
					s			=>	result);
					
	
		
	uMemoria: ENTITY WORK.uMemoria
	PORT	  MAP(
					clk					=>	CLK,
					uaddr			=>	uaddr_aux,
					UI						=>	UI_AUX(28 DOWNTO 0));
					
	FDD_SCLR: ENTITY WORK.FDD_SCLR
	PORT	  MAP(
					clk	=>	CLK,	
					rst	=>	RST,	
					ena	=>	en_uPC,	
					sclr	=>	clr_uPC,	
					d		=>	d_uPC,
					
					q		=>	q_uPC);	
		

			offset 	<= UI_AUX(2 DOWNTO 0);
			jcond  	<= UI_AUX(5 DOWNTO 3);
			clr_uPC	<= UI_AUX(6);
			en_uPC	<= UI_AUX(7);
			
			UI_U 		<= UI_AUX(28 DOWNTO 8);  	 


			uaddr_aux <= (opcode(4 DOWNTO 0)) & (q_uPC(2 DOWNTO 0));		
	
END ARCHITECTURE;