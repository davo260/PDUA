LIBRARY IEEE;
USE 	  IEEE.STD_LOGIC_1164.ALL;

ENTITY add_sub IS
	GENERIC (N	:	INTEGER	:= 8 );
	PORT (
				a			:	IN		STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				b			:	IN		STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				addn_sub	:	IN		STD_LOGIC;
				s			:	OUT	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				cout		: 	OUT	STD_LOGIC
);

END ENTITY add_sub;

ARCHITECTURE RTL OF add_sub	IS
	
	SIGNAL bxor					:	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL ADD_NSUB_VECTOR	:	STD_LOGIC_VECTOR(N-1 DOWNTO 0);

BEGIN
	Vector_generation:	FOR i IN N-1 DOWNTO 0 GENERATE
									add_nsub_vector(i)	<=	addn_sub;
								END GENERATE;
	bxor	<=	b XOR add_nsub_vector;
	
	adder	:	ENTITY WORK.nbit_adder
	GENERIC MAP(N	=> N	)
	PORT 	  MAP(
					a		=>		a,
					b		=>		bxor,
					cin	=>		addn_sub,
					s		=>		s,
					cout	=>		cout
	);
	
END ARCHITECTURE RTL;