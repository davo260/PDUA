LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------
ENTITY	IR	IS
	PORT(		clk_IR	:	IN		STD_LOGIC;
				rst_IR	:	IN		STD_LOGIC;
				sclr_IR	:	IN		STD_LOGIC;
				ena_IR	:	IN		STD_LOGIC;
				d_IR	   :	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);	
				q_IR		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END IR;
-----------------------------------------
ARCHITECTURE rtl OF	IR	IS
	
	

BEGIN
dff:  PROCESS(clk_IR,rst_IR,d_IR,sclr_IR)
		BEGIN
			IF(rst_IR='1')THEN
			
				q_IR <= (OTHERS=>'0');
				
			ELSIF(rising_edge(clk_IR))THEN
			
				IF(sclr_IR='1')THEN
				
					q_IR <= (OTHERS=>'0');
					
				ELSIF(ena_IR ='1')THEN
				
					q_IR <= d_IR;
					
				END IF;
				
			END IF;
			
		END PROCESS;

END ARCHITECTURE;