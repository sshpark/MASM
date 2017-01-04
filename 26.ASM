
CSEG SEGMENT
	ASSUME CS: CSEG
	START:
		MOV 	AX, 0
		MOV 	BX, 06EH				;给al赋初值
		MOV 	DH, BL 					;将bl作为暂存器
		MOV 	BH, 2 					;循环两次输出16进制位
		MOV 	CL, 4
		ROL		BL, CL 					;交换al的高4位和低4位
		AND		BL, 0FH 				;屏蔽高4位
	LOP:
		CMP		BL, 0 					;判断al是否属于0～9
		JB 		EXIT
		CMP 	BL, 9
		JA		AF 						;大于则跳转到判断是否属于a～f
		OR	 	BL, 30H
		JMP 	DISP

	AF: 								;判断是否属于a～f
		CMP 	BL, 10
		JB		EXIT
		CMP 	BL, 15
		JA 		EXIT
		ADD		BL, 37H
		JMP		DISP

	DISP: 								;显示十六进制数
		MOV 	DL, BL
		MOV 	AH, 02H
		INT 	21H
		DEC 	BH 						;bh减1
		CMP 	BH, 0
		JE 		EXIT
		MOV 	BL, DH
		AND 	BL, 0FH 				;屏蔽高4位
		JMP		LOP 	

	EXIT:
		MOV 	AH, 4CH
		INT 	21H
CSEG ENDS
END START