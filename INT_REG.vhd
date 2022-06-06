LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY INT_REG IS
	PORT(
				clk	:	IN		STD_LOGIC;
				rst	:	IN		STD_LOGIC;
				ena	:	IN		STD_LOGIC;
				sclr	:	IN		STD_LOGIC;
				d		:	IN		STD_LOGIC;
				q		:	OUT	STD_LOGIC	
);
END INT_REG;

ARCHITECTURE rtl OF INT_REG IS

BEGIN
	

dff:  PROCESS(clk,rst,d,sclr)
		BEGIN
			IF(rst='1')THEN
			
				q <= '0';
				
			ELSIF(rising_edge(clk))THEN
			
				IF(sclr='1')THEN
				
					q <= '0';
					
				ELSIF(ena ='1')THEN
				
					q <= d;
					
				END IF;
				
			END IF;
			
		END PROCESS;
END ARCHITECTURE;