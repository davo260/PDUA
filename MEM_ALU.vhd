-- Tercer Proyecto 
-- Memorias
-- Eduardo Andres Gerlein
-- Diego Vera,  Laura Cortés
-- Organización de computadores

LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;

ENTITY	MEM_ALU	IS
	PORT(	CLK					:	IN		STD_LOGIC;
			RST					:	IN		STD_LOGIC;
			mdr_alu_n			:	IN		STD_LOGIC;	
			bank_wr_en			:	IN		STD_LOGIC;							--Regiter Bank
			B_Bus_addr			:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);	--Regiter Bank, read_data_address
			C_Bus_addr			:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);	--Regiter Bank, write_data_address
			ir_en					:	IN		STD_LOGIC;
			sclr_IR				:	IN		STD_LOGIC;	
			mar_en				:	IN		STD_LOGIC;
			wr_rdn				:	IN		STD_LOGIC;						
			mdr_en				:	IN		STD_LOGIC;
			enaf					:	IN		STD_LOGIC;
			selop					:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);
			shamt					:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
			BUS_C					:	INOUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			IR_TO_CU				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			C,N,Z,P				:	OUT	STD_LOGIC
);
END MEM_ALU;

ARCHITECTURE rtl OF	MEM_ALU	IS
	
	SIGNAL BUS_B_AUX 		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL BUS_A_AUX 		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL BUS_B_BUFF 	: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
	
	Memorias:ENTITY WORK.memorias
		PORT MAP(	
					CLK					=>	CLK,
					RST					=>	RST,
					mdr_alu_n			=>	mdr_alu_n,
					bank_wr_en			=>	bank_wr_en,							--Regiter Bank
					B_Bus_addr			=>	B_Bus_addr,	--Regiter Bank, read_data_address
					C_Bus_addr			=>	C_Bus_addr,	--Regiter Bank, write_data_address
					ir_en					=>	ir_en,
					sclr_IR				=> sclr_IR,
					mar_en				=>	mar_en,
					wr_rdn				=>	wr_rdn,							--SPRAM
					mdr_en				=>	mdr_en,
					A_BUS					=>	BUS_A_AUX,
					B_BUS				=>	BUS_B_AUX,
					BUS_C					=>	BUS_C,
					IR_TO_CU				=>	IR_TO_CU
				 );
				
	ALU:	ENTITY WORK.ALU
		PORT MAP(	
					clk					=>	CLK,
					rst					=>	RST,
					busA					=>	BUS_A_AUX,
					busB					=> BUS_B_AUX,
					selop					=>	selop,
					shamt					=>	shamt,
					enaf 					=>	enaf,
					busC					=>	BUS_B_BUFF,
					C						=> C,
					N						=> N,
					Z						=> Z,
					P						=> P
					);

Union: ENTITY WORK.dq_ALU
		PORT MAP(	
					mdr_alu_n				=>	mdr_alu_n,
					B_Bus_IN					=>	BUS_B_BUFF,
					dq_ALU					=>	BUS_C);
								
END ARCHITECTURE;