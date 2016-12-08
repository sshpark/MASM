DSEG SEGMENT
	VAR1 DB 0FFH		;定义第一个数据
	VAR2 DB 0FFH		;定义第二个数据
	VAR3 DD ?			;定义一个双字变量
DSEG ENDS

CSEG SEGMENT
	ASSUME CS:CSEG, DS:DSEG
	START:
		MOV AX, DSEG
		MOV DS, AX
		MOV AH, VAR1
		MOV AL, AH
		MUL AH				;进行al * ah 的操作，求 x 的平方
		MOV DX, AX
		MOV AL, VAR2
		MOV AH, AL
		MUL AH				;进行al * ah 的操作，求 y 的平方
		ADD DX, AX			;进行 x2 + y2 的操作
		MOV WORD PTR VAR3, DX			;将和送入var3变量的低字、
		MOV DX, 0000H
		ADC DX, 0000H					;得到进位
		MOV WORD PTR VAR3 + 2, DX
		MOV AH, 4CH
		INT 21H
CSEG ENDS
END START
		
