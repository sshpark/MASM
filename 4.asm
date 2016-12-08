;输入一个小写字母，找出他的前导字符以及后继字符，并按照顺序输出这三个字母
CSEG SEGMENT
	ASSUME CS:CSEG
	START:
	INPUT:
		MOV AH,07H			;调用dos 07号功能
		INT 21H
		CMP AL, 'a'			;判断输入字母是否为小写字母
		JB INPUT
		CMP AL, 'z'
		JA INPUT
		DEC AL				;前导字符
		MOV CX, 3			;循环次数
	DISPLAY:				;循环输出
		MOV DL, AL		
		MOV AH, 02H
		INT 21H
		INC AL
		LOOP DISPLAY
		
		MOV AH, 4CH			;返回dos
		INT 21H
CSEG ENDS
END START

