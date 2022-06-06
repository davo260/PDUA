LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------
ENTITY	My_Reg	IS
	GENERIC( MAX_WITH	:	INTEGER	:=	8);
	PORT(		clk	:	IN		STD_LOGIC;
				rst	:	IN		STD_LOGIC;
				ena	:	IN		STD_LOGIC;
				d		:	IN		STD_LOGIC_VECTOR(MAX_WITH-1 DOWNTO 0);	
				q		:	OUT	STD_LOGIC_VECTOR(MAX_WITH-1 DOWNTO 0));
END My_Reg;
-----------------------------------------
ARCHITECTURE rtl OF	My_Reg	IS
BEGIN

My_Reg:	
	PROCESS(clk, rst, d)
	BEGIN
		IF(rst = '1') THEN
			q <= (OTHERS => '0');
		ELSIF(RISING_EDGE(clk)) THEN
			IF(ena ='1') THEN
				q <= d;
			END IF;
		END IF;	
	END PROCESS My_Reg;
	
END ARCHITECTURE;	