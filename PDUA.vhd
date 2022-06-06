LIBRARY	IEEE;
USE		IEEE.STD_LOGIC_1164.ALL;

ENTITY PDUA IS
	PORT(	CLK					:	IN		STD_LOGIC;
			RST					:	IN		STD_LOGIC;
			INT					:	IN		STD_LOGIC

			);
END PDUA;

ARCHITECTURE rtl OF	PDUA	IS

	SIGNAL enaf_s			: STD_LOGIC;
	SIGNAL selop_s			: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL shamt_s 		: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL bank_wr_en_s 	: STD_LOGIC;
	SIGNAL busB_addr_s 	: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL busC_addr_s 	: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL mar_en_s 		: STD_LOGIC;
	SIGNAL mdr_en_s 		: STD_LOGIC;
	SIGNAL mdr_alu_n_s 	: STD_LOGIC;
	SIGNAL int_clr_s 		: STD_LOGIC;
	SIGNAL iom_s 			: STD_LOGIC;
	SIGNAL wr_rdn_s 		: STD_LOGIC;
	SIGNAL ir_clr_s 		: STD_LOGIC;
	SIGNAL ir_en_s 		: STD_LOGIC;
	
	
	SIGNAL C_s 				: STD_LOGIC;
	SIGNAL N_s 				: STD_LOGIC;
	SIGNAL Z_s 				: STD_LOGIC;
	SIGNAL P_s 				: STD_LOGIC;
	
	SIGNAL INT_REG_s 		: STD_LOGIC;
	
	SIGNAL IR_TO_UC_s 	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SIGNAL UI_U_aux 		: STD_LOGIC_VECTOR(20 DOWNTO 0);
	
	
	
	

BEGIN
	
	
			enaf_s 		<= UI_U_aux(20);
			selop_s  	<= UI_U_aux(19 DOWNTO 17);
			shamt_s		<= UI_U_aux(16 DOWNTO 15);
			busB_addr_s <= UI_U_aux(14 DOWNTO 12);
			busC_addr_s <= UI_U_aux(11 DOWNTO 9);
			bank_wr_en_s<= UI_U_aux(8);
			mar_en_s  	<= UI_U_aux(7);
			mdr_en_s  	<= UI_U_aux(6);
			mdr_alu_n_s <= UI_U_aux(5);
			int_clr_s  	<= UI_U_aux(4);
			iom_s  		<= UI_U_aux(3);
			wr_rdn_s  	<= UI_U_aux(2);
			ir_en_s  	<= UI_U_aux(1);
			ir_clr_s  	<= UI_U_aux(0);
			
			
				
	INT_REG: ENTITY WORK.INT_REG
	PORT	  MAP(
					clk	=>	CLK,	
					rst	=>	RST,	
					ena	=>	INT,	
					sclr	=>	int_clr_s,	
					d		=>	'1',
					q		=>	INT_REG_s
					);	
					
					
	MEM_ALU: ENTITY WORK.MEM_ALU
	PORT		MAP(
					CLK				=>	CLK,			
					RST				=>	RST,
					
					mdr_alu_n		=>	mdr_alu_n_s,
					bank_wr_en		=>	bank_wr_en_s,
					B_Bus_addr		=>	busB_addr_s,
					C_Bus_addr		=>	busC_addr_s,
					ir_en				=>	ir_en_s,
					sclr_IR			=>	ir_clr_s,
					mar_en			=>	mar_en_s,
					wr_rdn			=>	wr_rdn_s,					
					mdr_en			=>	mdr_en_s,
					
					enaf				=>	enaf_s,
					selop				=> selop_s,	
					shamt				=>	shamt_s,
					
					IR_TO_CU			=> IR_TO_UC_s,
					
					C					=> C_s,
					N					=> N_s,
					Z					=> Z_s,
					P					=> P_s
					
	
	);
					
	uControl: ENTITY WORK.microcontrol
	PORT		MAP(				
					CLK				=>	CLK,			
					RST				=>	RST,

					C					=>	C_s,
					N					=>	N_s,
					Z					=>	Z_s,
					P					=>	P_s,
					int			   =>	INT_REG_s,
					
					opcode			=>	IR_TO_UC_s(7 DOWNTO 3),
					
					UI_U				=> UI_U_aux
				);	

END ARCHITECTURE;
