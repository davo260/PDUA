LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;
--------------------------------------------------------------------
ENTITY Register_file IS
	GENERIC( DATA_WIDTH			:	integer:= 8;
				ADDR_WIDTH			:	integer:= 3); ---3
		PORT(	clk					:	IN STD_LOGIC;
				rst					:	IN STD_LOGIC;
				wr_en					:	IN STD_LOGIC; 	
				r_addr				:	IN STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0);			
				w_addr				:	IN	STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0);			
				w_data				:	IN STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
				A_BUS			      :	OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
				B_BUS					:	OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)
				);
END ENTITY Register_file;
--------------------------------------------------------------------
ARCHITECTURE  rtl OF Register_file IS

	TYPE mem_type IS ARRAY (0 TO (2**ADDR_WIDTH)-1) OF STD_LOGIC_VECTOR (DATA_WIDTH-1 DOWNTO 0);
	SIGNAL array_reg		: 	mem_type;
	---SIGNAL Aux 	:  STD_LOGIC_VECTOR(2 DOWNTO 0):="111";
	--array_reg(0) <="00000001"; 

BEGIN
	
	---Aux <= "111";
	
	write_process: PROCESS (clk)
	BEGIN
		IF (rst = '1') THEN
			array_reg(0) <= "00000001"; --pc 000
			array_reg(1) <= "00000101"; --sp  001 
			array_reg(2) <= "00000001"; -- dptr 010
			array_reg(3) <= "11110000"; -- reg A
			array_reg(4) <= "00000001"; -- ivp
			array_reg(5) <= "00000001"; -- temp
			array_reg(6) <= "11111111"; -- cte -1
			array_reg(7) <= "00001110"; -- acc
		
		ELSIF (rising_edge(clk)) THEN
				IF(wr_en='1') THEN
			
				array_reg(to_integer(unsigned(w_addr))) <= w_data;
				
				END IF;
		END IF;
		
	END PROCESS;
	
	B_BUS <= array_reg(to_integer(unsigned(r_addr)));
	A_BUS	<= array_reg(7);
	
		
END ARCHITECTURE;