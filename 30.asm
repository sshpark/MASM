		;输入不超过50个字符的字符串，该字符串必须以 $ 结尾
		
		DSEG SEGMENT
		MAX DB	50 						;定义50个字符串的缓冲区
		ACT	DB  ?
		STR	DB 	50		DUP(?)
		DIGIT	DB		'At least one DIGIT!'
		CHARA	DB		'At least one CHARACTER included!'
		DSEG ENDS
		
		CSEG SEGMENT
		ASSUME CS: CSEG, DS: DSEG
		START:
		MOV 	AX, DSEG
		MOV 	DS, AX
		MOV 	AH, 0AH 			;输入字符串以 $ 结尾
		LEA 	DX, MAX
		INT 	21H
		MOV 	BX, 0 				;初始化 bx 为零，其中如果有数字，bl为 1，如果有字母，bh为 1
		LEA 	SI,	STR 			;si指向该输入字符串的缓冲区
		MOV 	AX, 0 				;ax 初始化为零
		
		LOP:
		MOV		AL, [SI] 			;将字符放入al
		CMP 	AL,  			;如果是 $ ，则跳转至az，判断是否含有字母
		JE 		DISP
		CMP 	AL, 30H 			;判断当前字符是否属于0～9
		JB		NEXT 				;否则比较下一个字符
		CMP 	AL, 39H
		JA 		AZ
		MOV 	BL, 1 				;若有一个字符属于0～9，则设置bl为 1
		JMP 	NEXT
		AZ: 							;判断是否含有字母
		CMP 	AL, 41H 			;判断是否属于A～Z
		JB 		NEXT				;否则比较下一个字符
		CMP 	AL, 5AH 			
		JA 		XIAO 				;如果大于Z，跳转至XIAO判断是否属于a～z
		MOV 	BH, 1 				;若有一个字符属于字母，则设置bh为 1
		JMP 	NEXT
		XIAO: 							;判断是否属于a～z
		CMP 	AL, 61H
		JB 		NEXT
		CMP 	AL, 7AH
		JA 		NEXT
		MOV 	BH, 1 				;若有一个字符属于字母，则设置bh为 1
		NEXT:
		INC 	SI
		JMP		LOP
		
		DISP:
		CMP		BL, 1 				;若bl为 1，则输出 DIGIT 字符串信息
		JE		DISPDIGIT
		CMP 	BH, 1 				;否则判断bh， 若bh为 1，则输出 CHARA 字符串信息
		JE 		DISPCHAR
		JMP 	EXIT 				;若bx为零，返回 dos
		
		DISPDIGIT:
		LEA 	DX, DIGIT 			;输出 DIGIT 字符串信息
		MOV 	AH, 09H
		INT 	21H
		CMP 	BH, 1 				;判断bh， 若bh为 1，则输出 CHARA 字符串信息
		JE 		DISPCHAR
		JMP		EXIT
		
		DISPCHAR:
		LEA 	DX, CHARA 			;输出 CHARA 字符串信息
		MOV 	AH, 09H
		INT 	21H
		MOV 	AH, 4CH
		INT 	21H
		
		EXIT:
		MOV 	AH, 4CH
		INT 	21H
		CSEG ENDS
		END START
