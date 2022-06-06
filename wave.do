onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_u_pdua_tb/DUT/CLK
add wave -noupdate /test_u_pdua_tb/DUT/RST
add wave -noupdate /test_u_pdua_tb/DUT/INT
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/Memorias/REGISTER_BANK/r_addr
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/Memorias/REGISTER_BANK/w_addr
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/Memorias/REGISTER_BANK/w_data
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/Memorias/REGISTER_BANK/array_reg(0)
add wave -noupdate -expand /test_u_pdua_tb/DUT/MEM_ALU/Memorias/REGISTER_BANK/array_reg
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/busA
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/busB
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/selop
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/shamt
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/enaf
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/busC
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/C
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/N
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/Z
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/ALU/P
add wave -noupdate /test_u_pdua_tb/DUT/uControl/opcode
add wave -noupdate /test_u_pdua_tb/DUT/uControl/UI_U
add wave -noupdate /test_u_pdua_tb/DUT/uControl/uMemoria/uaddr
add wave -noupdate /test_u_pdua_tb/DUT/enaf_s
add wave -noupdate /test_u_pdua_tb/DUT/selop_s
add wave -noupdate /test_u_pdua_tb/DUT/shamt_s
add wave -noupdate /test_u_pdua_tb/DUT/bank_wr_en_s
add wave -noupdate /test_u_pdua_tb/DUT/busB_addr_s
add wave -noupdate /test_u_pdua_tb/DUT/busC_addr_s
add wave -noupdate /test_u_pdua_tb/DUT/mar_en_s
add wave -noupdate /test_u_pdua_tb/DUT/mdr_en_s
add wave -noupdate /test_u_pdua_tb/DUT/mdr_alu_n_s
add wave -noupdate /test_u_pdua_tb/DUT/int_clr_s
add wave -noupdate /test_u_pdua_tb/DUT/iom_s
add wave -noupdate /test_u_pdua_tb/DUT/wr_rdn_s
add wave -noupdate /test_u_pdua_tb/DUT/ir_clr_s
add wave -noupdate /test_u_pdua_tb/DUT/ir_en_s
add wave -noupdate /test_u_pdua_tb/DUT/INT_REG_s
add wave -noupdate /test_u_pdua_tb/DUT/IR_TO_UC_s
add wave -noupdate /test_u_pdua_tb/DUT/UI_U_aux
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/Memorias/ADDRESS_BUS
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/Memorias/BUS_DATA_OUT
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/Memorias/BUS_DATA_IN
add wave -noupdate /test_u_pdua_tb/DUT/MEM_ALU/Memorias/IR_TO_CU
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19830 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 161
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {525 ns}
