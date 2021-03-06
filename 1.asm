DSEG SEGMENT
	VAR1 DB 0FFH
	VAR2 DB 0FFH
	VAR3 DD ?							;定义1个双字变量
DSEG ENDS

CSEG SEGMENT
	ASSUME CS: CSEG, DS:DSEG
	START:
		MOV AX, DSEG					;数据段的段首址送入AX寄存器
		MOV DS, AX
		MOV AH, VAR1
		MOV AL, AH
		MUL AH
		MOV DX, AX
		MOV AL, VAR2
		MOV AH, AL
		MUL AH
		ADD DX, AX
		MOV WORD PTR VAR3, DX
		MOV DX, 0000H
		ADC DX, 0000H
		MOV WORD PTR VAR3 + 2, DX
		MOV AH, 4CH
		INT 21H
CSEG ENDS
END START
