CSEG SEGMENT
	ASSUME CS: CSEG

	START:
		MOV 	AH, 07H					;从键盘接受一个16位数值
		INT 	21H
		CMP		AL, 30H					;判断数字是否0～9
		JB		START
		CMP		AL, 39H
		JA		AF						;大于的话跳转到A-F处理
		MOV		BL, AL
		AND		BL, 0FH
		MOV		CX, 4
		ROL		BL, CL					;将bl的高四位以及低四位交换
		JMP		DISPLAY

	AF:
		AND		AL, 11011111B			;将其转换为大写字母
		CMP		AL, 46H					;判断该数值是否在A ~ F
		JA		START
		CMP 	AL, 41H
		JB		START
		ADD		AL, 9					;加 9 调整
		MOV		BL, AL
		AND		BL, 0FH
		MOV		CX, 4
		ROL		BL, CL					;将bl的高四位以及低四位交换
		JMP		DISPLAY

	DISPLAY:
		MOV 	DL, 0
		ROL		BL, 1
		RCL		DL, 1
		ADD		DL, 30H
		MOV		AH, 02H
		INT		21H
		LOOP	DISPLAY

		MOV		AH, 4CH
		INT		21H
CSEG ENDS
END START