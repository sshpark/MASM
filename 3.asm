;从键盘输入小写字母，用大写字母输出

CSEG SEGMENT
	ASSUME CS:CSEG
	START:
		MOV AH, 07H
		INT 21H
		MOV DL,AL
		MOV AH, 02H
		INT 21H
		MOV AH,4CH
		INT 21H
CSEG ENDS
END START