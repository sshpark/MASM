;已知10名学生的成绩，现在需要统计学生几个人数以及不及格人数，并将统计出来的人数在屏幕上显示

DSEG SEGMENT
	GRADE DB 58,69,56,44,95,12,77,86,96,63	;定义10个人的成绩
	MESS  DB 0DH, 0AH, "$"					;回车换行
DSEG ENDS

CSEG SEGMENT 
	ASSUME CS: CSEG, DS: DSEG
	START:
		MOV AX, DSEG
		MOV DS, AX
		MOV CX, 10
		MOV SI, OFFSET GRADE				;si <- GRADE
		MOV BX, 0000H
		MOV BP, 0000H
	AGAIN:
		MOV AL, DS:[SI]						;取分数
		CMP AL, 60D
		JAE JIGE							;分数大于60就跳转到jige标号处,否则顺序执行
		
		INC BX								;不及格的人数加1
		JMP EXIT
		
	JIGE:
		INC BP								;及格人数加1
	EXIT:
		INC SI
		LOOP AGAIN							;cx自减 1 后， 如果不为零则转移到again标号处
	
	DISPLAY:
		ADD BX, 30H							;不及格人数调整为ascii码
		MOV DL, BL							;将不及格人数送入dl
		MOV AH, 02H
		INT 21H
		LEA DX, MESS						;显示回车换行
		
		MOV AH, 09H
		INT 21H
		ADD BP, 30H
		MOV DX, BP							;将及格人数送入dl, 因为BP为16 位寄存器
		MOV AH, 02H
		INT 21H
		MOV AH, 4CH
		INT 21H
CSEG ENDS
END START
