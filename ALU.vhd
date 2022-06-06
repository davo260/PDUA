LIBRARY IEEE;
USE 	  IEEE.STD_LOGIC_1164.ALL;
USE	  IEEE.NUMERIC_STD.ALL;

ENTITY ALU IS
	GENERIC (MAX_W	:	INTEGER	:= 8 );
	PORT (
				clk			:	IN		STD_LOGIC;
				rst			:	IN		STD_LOGIC;
				busA			:	IN		STD_LOGIC_VECTOR(MAX_W-1 DOWNTO 0);
				busB			:	IN		STD_LOGIC_VECTOR(MAX_W-1 DOWNTO 0);
				selop			:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);
				shamt			:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
				enaf			:	IN		STD_LOGIC;
				
				busC			:	OUT	STD_LOGIC_VECTOR(MAX_W-1 DOWNTO 0);
				C,N,Z,P		:	OUT	STD_LOGIC);

END ENTITY ALU;

ARCHITECTURE RTL OF ALU	IS

	
	SIGNAL cout_aux 	:	STD_LOGIC;
	SIGNAL result_aux :	STD_LOGIC_VECTOR(MAX_W-1 DOWNTO 0);

BEGIN

	Processing_unit: ENTITY WORK.Processing_unit
							PORT	  MAP(
												dataa			=>	busA,
												datab			=>	busB,
												selop			=>	selop,
												result		=>	result_aux,
												cout			=>	cout_aux);
												
	Flag_Register: ENTITY WORK.Flag_Register
							PORT	  MAP(
												clk			=>	clk,
												rst			=>	rst,
												enaf			=>	enaf,
												dataa			=>	result_aux,
												carry			=>	cout_aux,
												C				=>	C,
												N				=>	N,
												Z				=> Z,
												P				=> P
												);
	
	Shift_unit: ENTITY WORK.Shift
							PORT	  MAP(
												shamt			=>	shamt,
												dataa			=>	result_aux,
												dataAOUT			=>	busC	
												);
	
END ARCHITECTURE RTL;