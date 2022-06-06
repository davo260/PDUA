LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FDD_SCLR IS
	PORT(
				clk	:	IN		STD_LOGIC;
				rst	:	IN		STD_LOGIC;
				ena	:	IN		STD_LOGIC;
				sclr	:	IN		STD_LOGIC;
				d		:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);
				q		:	OUT	STD_LOGIC_VECTOR(2 DOWNTO 0)	
);
END FDD_SCLR;

ARCHITECTURE rtl OF FDD_SCLR IS

BEGIN

dff:  PROCESS(clk,rst,d,sclr)
		BEGIN
			IF(rst='1')THEN
			
				q <= (OTHERS=>'0');
				
			ELSIF(rising_edge(clk))THEN
			
				IF(sclr='1')THEN
				
					q <= (OTHERS=>'0');
					
				ELSIF(ena ='1')THEN
				
					q <= d;
					
				END IF;
				
			END IF;
			
		END PROCESS;
END ARCHITECTURE;	