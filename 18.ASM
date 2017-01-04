;统计一个数值中含有多少个 1
DSEG SEGMENT
	VAR1	DW	0FFFFH
	COUNT	DB	00H
DSEG ENDS

CSEG SEGMENT
	ASSUME CS: CSEG, DS: DSEG
	START:
		MOV		AX, DSEG
		MOV		DS, AX
		MOV		BL, COUNT			;将统计变量赋给bl
		MOV		AX, VAR1
		ADD		AX, 00H
		JZ		DISP				;判断ax是否为零
		MOV		CX, 16
		CLC							;清除标志位

	AGAIN:
		RCL		AX, 1
		JNC		NEXT				;判断cf是否为0
		INC		BL					;如果不为零，则计数值加1

	NEXT:
		LOOP	AGAIN
		MOV		COUNT, BL			;将计数值保存在count中

	DISP:
		MOV		AH, 0000H
		MOV		AL, BL
		CBW
		MOV		BL, 0AH 			;除数等于10
		DIV		BL					;做ax／bl运算，分离出商和余数
		ADD		AL, 30H				;转换为bcd码
		MOV		DL, AL				;准备入口参数
		MOV		BH, AH 				;将余数保存在bh中
		MOV		AH, 02H
		INT 	21H
		ADD		BH, 30H
		MOV		DL, BH
		MOV		AH, 02H
		INT		21H
		MOV		AH, 4CH
		INT		21H
CSEG ENDS
END START



