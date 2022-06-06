LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;
USE 		IEEE.NUMERIC_STD.ALL;

ENTITY	MDR	IS
	GENERIC(	DATA_WIDTH	:	INTEGER	:=	8;
				ADDR_WIDTH	:	INTEGER	:=	3);
				
	PORT(		clk_in			:	IN		STD_LOGIC;
				rst_in			:	IN		STD_LOGIC;
				mdr_en			:	IN		STD_LOGIC;
				mdr_alu_n		:	IN		STD_LOGIC;
				DATA_Bus_IN	   :	IN		STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
				DATA_Bus_OUT	:	OUT	STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
				dq					:	INOUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)
		  );

END MDR;

ARCHITECTURE testbench OF	MDR	IS
	
	SIGNAL AUX_A	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL AUX_B	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
	dq	<= (AUX_A) WHEN mdr_alu_n='1' ELSE "ZZZZZZZZ";
	AUX_B	<= dq;
	
MDR_DFFs:
	PROCESS(rst_in, clk_in, mdr_en) IS 
	BEGIN	
		IF(rst_in='1')THEN
		
			DATA_Bus_OUT <= (OTHERS=>'0');
			AUX_A <=  (OTHERS=>'0');
			
		ELSIF(RISING_EDGE(clk_in)) THEN
			IF(mdr_en = '1')THEN
						
				DATA_Bus_OUT <= AUX_B;
				AUX_A <= DATA_Bus_IN;
		
			END IF;	
		END IF;
		
	END PROCESS;
END ARCHITECTURE;