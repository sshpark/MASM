
;-------------------------------------------------------

DSEG SEGMENT
	DB 'i am a student'
DSEG ENDS

;-------------------------------------------------------

CSEG SEGMENT
	ASSUME CS: CSEG, DS: DSEG
	START:
		MOV		AX, DSEG
		MOV 	DS, AX
		MOV		SI, 0
		MOV		CX, 12
		CALL	TOUPPER
		MOV		AH, 4CH
		INT 21H

	;将字母转换为大写，循环次数在cx中
	TOUPPER:
		AND		BYTE PTR [SI], 11011111B
		INC 	SI
		LOOP	TOUPPER
		RET
CSEG ENDS
END START