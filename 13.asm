;用si和di将字符串“welcome to masm”复制到其后的数据区中

ASSUME CS: CSEG, DS: DSEG

DSEG SEGMENT
	DB "welcome to masm!"
	DB "................"
DSEG ENDS

CSEG SEGMENT
	START:
		MOV AX, DSEG
		MOV DS, AX
		MOV SI, 0
		MOV DI, 16
		MOV CX, 8

	S:
		MOV AX, [SI]
		MOV [DI], AX
		ADD SI, 2
		ADD DI, 2
		LOOP S

		MOV AH, 4CH
		INT 21H
CSEG ENDS
END START