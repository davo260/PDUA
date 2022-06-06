LIBRARY IEEE;
USE 	  IEEE.STD_LOGIC_1164.ALL;

ENTITY Shift IS
	GENERIC (N	:	INTEGER	:= 8 );
	PORT (
				shamt			:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
				dataA			:	IN		STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				dataAOUT		: 	OUT	STD_LOGIC_VECTOR(N-1 DOWNTO 0)
				
);

END ENTITY Shift;

ARCHITECTURE RTL OF Shift	IS
BEGIN
	
	dataAOUT <= dataA		WHEN shamt = "00" ELSE -- No shift
				'0' & dataA(N-1 DOWNTO 1)  WHEN shamt = "01" ELSE --srl
				 dataA(N-2 DOWNTO 0) & '0'  WHEN shamt = "10" ELSE --sll
				 (OTHERS => '0'); -- NU
	
	
END ARCHITECTURE RTL;