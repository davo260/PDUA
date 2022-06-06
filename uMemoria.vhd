LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-----------------------------------------------------
ENTITY uMemoria IS
PORT(	clk 	: 	IN 	STD_LOGIC;
		uaddr	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
		UI		: 	OUT 	STD_LOGIC_VECTOR(28 DOWNTO 0));
END ENTITY uMemoria;
-----------------------------------------------------
ARCHITECTURE behavioral OF uMemoria IS
BEGIN
	
	MUI: PROCESS(uaddr)
	BEGIN
		CASE uaddr IS
	-- Complete the following values according to your particular implementation 
	-- Unused postions do not affect the operation of the ROM
			-- FETCH 
			WHEN "00000000" => UI <= "00000000000000000000010000000";
			WHEN "00000001" => UI <= "00000000000001000000010000000"; 
			WHEN "00000010" => UI <= "01100000000010000000010000000"; 
			WHEN "00000011" => UI <= "00000000000000100000010000000"; 
			WHEN "00000100" => UI <= "00000000000000010001011000000"; 
																					
			-- INT
			--WHEN "00000100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
			--WHEN "00000101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
			--WHEN "00000110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
			--WHEN "00000111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 

			--00001	 MOV ACC,A 
			WHEN "00001000" => UI <= "10000001111110000001111000000";
			WHEN "00001001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00001010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00001011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00001100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00001101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00001110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00001111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

			--00010  MOV A,ACC
			WHEN "00010000" => UI <= "10000011101110100001111000000";
			WHEN "00010001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00010010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00010011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00010100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00010101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00010110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00010111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

			--00011	 MOV ACC,CTE
			WHEN "00011000" => UI <= "00000000000001000000010000000";
			WHEN "00011001" => UI <= "01100000000010000000010000000";
			WHEN "00011010" => UI <= "00000011011110000001111000000";
			WHEN "00011011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00011100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00011101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00011110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00011111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

			--00100  MOV ACC,[DPTR]
			WHEN "00100000" => UI <= "00000001000001000000010000000";
			WHEN "00100001" => UI <= "00000000000000000000010000000";
			WHEN "00100010" => UI <= "00000000000000100000010000000";
			WHEN "00100011" => UI <= "00000000011110010001111000000";
			WHEN "00100100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00100101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00100110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00100111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

			--00101  MOV DPTR,ACC
			WHEN "00101000" => UI <= "00000011101010000001111000000";
			WHEN "00101001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00101010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00101011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00101100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00101101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00101110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00101111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

			-- 00110 MOV [DPTR],ACC	
			WHEN "00110000" => UI <= "00000001000001000000010000000";
			WHEN "00110001" => UI <= "00000011100000100000010000000";
			WHEN "00110010" => UI <= "00000011100000000011111000000";
			WHEN "00110011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00110100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00110101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00110110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00110111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

			-- 00111 INV ACC
			WHEN "00111000" => UI <= "10010011111110000001101000000";
			WHEN "00111001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00111010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00111011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00111100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00111101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00111110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "00111111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			 -- 01000 AND ACC,A	 
			WHEN "01000000" => UI <= "10100001111111000001111000000";
			WHEN "01000001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01000010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01000011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01000100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01000101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01000110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01000111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			-- 01001 ADD ACC,A
			WHEN "01001000" => UI <= "11010001111111000000101000000";
			WHEN "01001001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01001010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01001011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01001100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01001101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01001110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01001111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			-- 01010 JMP DIR														0x50
			WHEN "01010000" => UI <= "00000000000001000000010001000";
			WHEN "01010001" => UI <= "01100000000010000000010000000";
			WHEN "01010010" => UI <= "00000000000000010000010000000";
			WHEN "01010011" => UI <= "00000000000010010001111000000";
			WHEN "01010100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01010101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01010110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01010111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			-- 01011 JZ DIR														0x58
			WHEN "01011000" => UI <= "00000000000000000000010010010";
			WHEN "01011001" => UI <= "01100000000010000000101000000";
			WHEN "01011010" => UI <= "00000000000001000000010000000";
			WHEN "01011011" => UI <= "00000000000000110000010000000";
			WHEN "01011100" => UI <= "00000000000010010000101000000";
			WHEN "01011101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01011110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01011111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

			-- 01100 JN DIR														0x60
			WHEN "01100000" => UI <= "00000000000001000000010011010";
			WHEN "01100001" => UI <= "01100000000010000001111000000";
			WHEN "01100010" => UI <= "00000000000000000000010000000";
			WHEN "01100011" => UI <= "00000000000000100000010000000";
			WHEN "01100100" => UI <= "00000000000010010001111000000";
			WHEN "01100101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01100110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01100111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			-- 01101 JC DIR														0x68
			WHEN "01101000" => UI <= "00000000000001000000010100010";
			WHEN "01101001" => UI <= "01100000000010000001111000000";
			WHEN "01101010" => UI <= "00000000000000000000010000000";
			WHEN "01101011" => UI <= "00000000000000100000010000000";
			WHEN "01101100" => UI <= "00000000000010010001111000000";
			WHEN "01101101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01101110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01101111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			-- 01110  CALL DIR       											0x70
			WHEN "01110000" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01110001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01110010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01110011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01110100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01110101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01110110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01110111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			
			-- 01111  RET
			WHEN "01111000" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01111001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01111010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01111011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01111100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01111101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01111110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "01111111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			-- 10000  New Instruction 1
			WHEN "10000000" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10000001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10000010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10000011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10000100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10000101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10000110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10000111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			-- 10001  New Instruction 2
			WHEN "10001000" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10001001" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10001010" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10001011" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10001100" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10001101" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10001110" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			WHEN "10001111" => UI <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			
			------------------------------------
			-- Unused cases:
			WHEN others => UI <= (others => 'X');
		END CASE;
	END PROCESS;
END ARCHITECTURE Behavioral;



