;试编制一源程序，统计DA1字单元中含0的个数，如统计的个数为奇数，则将进位位置1，否则进位位清0。
DSEG SEGMENT
	DAT1	DB 		0FFH
DSEG ENDS

CSEG SEGMENT
	ASSUME 	CS: CSEG, DS: DSEG
	START:	
		MOV 	AX, DSEG
		MOV 	DS, AX
		XOR 	BX, BX
		MOV 	CX, 8
		MOV 	BL, DAT1
	LOP:
		ROR 	BL, 1
		JC	 	NEXT
		INC 	BH
	NEXT:
		LOOP 	LOP

	SETCF:
		TEST 	BH, 01H
		JZ 		SET0
		ROR 	BH, 1
		MOV 	AH, 4CH
		INT 	21H
	SET0:
		AND 	CL, CL
		MOV 	AH, 4CH
		INT 	21H
CSEG ENDS
END START

