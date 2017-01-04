;从键盘输入小写字母，用大写字母输出

CSEG SEGMENT
	ASSUME CS:CSEG
	START:
		MOV AH, 07H			;调用dos功能输入不回显
		INT 21H
		MOV DL,AL			;将al -> dl ，dl为02号功能的输入参数
		MOV AH, 02H
		INT 21H
		MOV AH,4CH			;结束程序
		INT 21H
CSEG ENDS
END START