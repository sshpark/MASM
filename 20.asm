;冒泡排序法

DSEG SEGMENT
	BLOCK	DB	12, 89, 32, 77, 33, 12
	N	DW	$ - BLOCK							;记录block块的长度
DSEG ENDS

CSEG SEGMENT
	ASSUME CS: CSEG, DS: DSEG
	START:
		MOV		AX, DSEG
		MOV		DS, AX
		MOV 	BX, OFFSET BLOCK
		MOV		CX, N
		DEC		CX								;循环次数为block长度减 1

	AGAIN1:
		MOV		DI, CX							;di作为暂存器
		MOV		SI, 0000H						;si指针复位

	AGAIN2:
		MOV		AL, [BX+SI]						;al <- a(i)
		CMP		AL, [BX+SI+1]
		JNB		NEXT1
		XCHG	AL, [BX+SI+1]
		MOV		[BX+SI], AL
	NEXT1:
		INC		SI
		LOOP	AGAIN2
		MOV 	CX, DI
		LOOP	AGAIN1
		MOV		AH, 4CH
		INT 21H
CSEG ENDS
END START
