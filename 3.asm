;从键盘输入小写字母，用大写字母输出

CSEG SEGMENT
	ASSUME CS:CSEG
	START:
		MOV AH, 07H				;调用dos 07 输入不回显功能
		INT 21H
		ADD AL, 20H				;将大写字母转换成小写字母输出
		MOV DL,AL
		MOV AH, 02H
		INT 21H
		MOV AH,4CH
		INT 21H
CSEG ENDS
END START