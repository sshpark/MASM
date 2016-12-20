;将定义的数据进行逆序排列

CSEG SEGMENT
	ASSUME CS: CSEG
	DW 1234H, 9023H, 0A127H			
	DW 0, 0, 0, 0, 0, 0					;这段空间将被当作栈来使用

	START:
		MOV AX, CSEG
		MOV SS, AX
		MOV SP, 12H 					;sp指向栈顶，初始状态的栈为空
		MOV BX, 0
		MOV CX, 3

	S1:
		PUSH CS:[BX]
		ADD BX, 2
		LOOP S1

		MOV BX, 0
		MOV CX, 3

	S2:
		POP CS:[BX]
		ADD BX, 2
		LOOP S2

		MOV AH, 4CH
		INT 21H
CSEG ENDS
END START