;编写一个程序，判别键盘上输入的字符；若是1-9字符，则显示之；若为A-Z或a-z字符，均显示“c”；若是回车字符<CR>(其ASCII码为0DH)
;则结束程序，若为其它字符则不显示，继续等待新的字符输入

CSEG SEGMENT
	ASSUME CS: CSEG
	START:
		MOV		AH, 08H			;输入字符
		INT 	21H
		CMP		AL, 0DH 		;判断是否为回车，如果是则退出程序
		JZ		EXIT
		CMP 	AL, 30H 		;判断是否属于0～9
		JB 		START
		CMP 	AL, 39H
		JA 		AZ 				;否则跳转到az
		JMP 	DISP

	AZ: 						;判断是否属于A～Z
		CMP 	AL, 41H
		JB 		START
		CMP 	AL, 5AH
		JA 		XIAO
		JMP 	DISPAZ

	XIAO: 						;判断是否属于a～z
		CMP 	AL, 61H
		JB 		START
		CMP 	AL, 7AH
		JA 		START
		JMP 	DISPAZ
	DISP: 						;为数字原样输出
		MOV 	DL, AL
		MOV 	AH, 02H
		INT 	21H
		JMP 	START

	DISPAZ: 					;为英语字母输出c
		MOV 	DL, 'c'
		MOV 	AH, 02H
		INT 	21H
		JMP 	START

	EXIT:
		MOV 	AH, 4CH
		INT 	21H
CSEG ENDS
END START