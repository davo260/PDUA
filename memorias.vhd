LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;

ENTITY	memorias	IS
	PORT(	CLK					:	IN		STD_LOGIC;
			RST					:	IN		STD_LOGIC;
			mdr_alu_n			:	IN		STD_LOGIC;	
			bank_wr_en			:	IN		STD_LOGIC;							--Regiter Bank
			B_Bus_addr			:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);	--Regiter Bank, read_data_address
			C_Bus_addr			:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);	--Regiter Bank, write_data_address
			ir_en					:	IN		STD_LOGIC;
			sclr_IR				:	IN		STD_LOGIC;
			mar_en				:	IN		STD_LOGIC;
			wr_rdn				:	IN		STD_LOGIC;							--SPRAM
			mdr_en				:	IN		STD_LOGIC;
			B_BUS				   :	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			A_BUS					:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			BUS_C					:	INOUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			IR_TO_CU				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)	
			);
END memorias;



ARCHITECTURE rtl OF	memorias	IS

	SIGNAL ADDRESS_BUS 	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL BUS_DATA_OUT 	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL BUS_DATA_IN 	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	

BEGIN

	IR:	ENTITY WORK.IR 
			PORT MAP(	
					clk_IR	=>	CLK,
					sclr_IR	=>	sclr_IR,
					rst_IR	=>	RST,
					ena_IR	=>	ir_en,
					d_IR	   =>	BUS_C,
					q_IR		=>	IR_TO_CU
					);
					
	MAR:	ENTITY WORK.MAR 
			PORT MAP(	
					clk_MAR	=>	CLK,
					rst_MAR	=>	RST,
					ena_MAR	=>	mar_en,
					d_MAR	   =>	BUS_C,
					q_MAR		=>	ADDRESS_BUS
					);	
			
			
	RAM:	ENTITY WORK.my_SPRAM
			PORT MAP(
					clk		=> CLK,	
					wr_rdn	=>	wr_rdn,
					addr		=> ADDRESS_BUS,
					w_data	=>	BUS_DATA_OUT,
					r_data  => BUS_DATA_IN
			);
	
	REGISTER_BANK:
			ENTITY WORK.Register_file
			PORT MAP(
					clk		=> CLK,	
					rst			=> RST,
					wr_en		=>	bank_wr_en,
					
					r_addr	=>	B_Bus_addr,
					w_addr	=>	C_Bus_addr,	
					w_data	=> BUS_C,
					
					B_BUS	=>	  B_BUS,
					A_BUS		=> A_BUS
			);
	
			
	MDR:	ENTITY WORK.MDR
			PORT MAP(
					clk_in			=>	CLK,	
					rst_in			=> RST,
					mdr_en			=>	mdr_en,
					mdr_alu_n		=>	mdr_alu_n,
					
					DATA_Bus_IN		=> BUS_DATA_IN, 
					
					DATA_Bus_OUT 	=>	BUS_DATA_OUT,
					
					dq					=> BUS_C
			);
				
END ARCHITECTURE;	