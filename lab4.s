.globl binary_search
binary_search:
			MOV R3,#0
			SUB R4,R2,#1
			MOV R8,R4,LSR #1
			MOV R5,R8
			MOV R6,#-1
			MOV R7,#1
			B loop
			
loop:		
			CMP R6,#-1
			BNE done
			CMP R3,R4
			BLE L1
			B done
			
L1:			
			LDR R10,[R0,R5,LSL #2]
			CMP R10,R1
			BNE L2
			MOV R6,R5
			B L4
			
L2:
			LDR R12,[R0,R5,LSL #2]
			CMP R12,R1
			BLE L3
			SUB R4,R5,#1
			B L4
			
L3:			
			ADD R3,R5,#1
			B L4
			
L4:
			RSB R11,R7,#0
			STR R11,[R0,R5,LSL #2]
			SUB R9,R4,R3
			MOV R9,R9,LSR #1
			ADD R9,R9,R3
			MOV R5,R9
			ADD R7,R7,#1
			B loop
			
done:		
			MOV PC,LR