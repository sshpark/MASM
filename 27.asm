DSEG SEGMENT
	STR 	DB 	'HELLO MY FRIEND, HOW ARE YOU?','$'
DSEG ENDS

CSEG SEGMENT
	ASSUME CS: CSEG, DS: DSEG
	START:
		MOV 	AX, DSEG
		MOV 	DS, AX
		MOV 	CX, 0000H
		LEA 	SI, STR

	LOP:
		MOV 	BX, [SI]
		CMP 	BX, '$'
		JE 		DISP1
		INC 	CX
		INC 	SI
		JMP 	LOP
	
	DISP1:
		MOV 	AL, CL					;给al赋初值
		MOV 	BL, AL 					;将bl作为暂存器
		MOV 	BH, 2 					;循环两次输出16进制位
		MOV 	CX, 4
		ROL		AL, CL 					;交换al的高4位和低4位
		AND		AL, 0FH 				;屏蔽高4位
	LOP1:
		CMP		AL, 0 					;判断al是否属于0～9
		JB 		EXIT
		CMP 	AL, 9
		JA		AF 						;大于则跳转到判断是否属于a～f
		OR	 	AL, 30H
		JMP 	DISP

	AF: 								;判断是否属于a～f
		CMP 	AL, 10
		JB		EXIT
		CMP 	AL, 15
		JA 		EXIT
		ADD		AL, 37H
		JMP		DISP

	DISP: 								;显示十六进制数
		MOV 	DL, AL
		MOV 	AH, 02H
		INT 	21H
		DEC 	BH 						;bh减1
		CMP 	BH, 0
		JE 		EXIT
		MOV 	AL, BL
		AND 	AL, 0FH 				;屏蔽高4位
		JMP		LOP1 	

	EXIT:
		MOV 	AH, 4CH 
		INT 	21H
CSEG ENDS
END START
