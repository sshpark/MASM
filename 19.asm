;统计在累加和大于1000的时候，自然数的个数并输出
DSEG SEGMENT
	SUM		DW		?
	COUNT	DW		?
DSEG ENDS

CSEG SEGMENT
	ASSUME	CS: CSEG, DS: DSEG
	START:	
		MOV		AX, DSEG
		MOV 	DS, AX
		MOV		AX, 0000H					;AX为递增的量
		MOV		BX, 0000H					;CX作为统计自然数个数

	SUMOF:
		INC		BX
		ADD		AX, BX
		CMP		AX, 1000
		JBE		SUMOF

		MOV		COUNT, BX
		MOV		SUM, AX

		MOV		AX,	COUNT
		MOV		BL, 0AH
		DIV		BL
		ADD		AL, 30H
		MOV		DL, AL
		MOV		BH, AH
		MOV		AH, 02H
		INT		21H
		ADD		BH, 30H
		MOV		DL, BH
		MOV		AH, 02H
		INT		21H
		MOV		AH, 4CH
		INT		21H
CSEG ENDS
END START
