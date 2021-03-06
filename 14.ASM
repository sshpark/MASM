DSEG SEGMENT
	DB '1. display      '
	DB '2. brows        '
	DB '3. replace      '
	DB '4. modify       '
DSEG ENDS

SSEG SEGMENT
	DW 0, 0, 0, 0, 0, 0, 0, 0
SSEG ENDS

CSEG SEGMENT
	ASSUME CS: CSEG, SS: SSEG, DS: DSEG
	START:
		MOV AX, DSEG
		MOV DS, AX
		MOV AX, SSEG
		MOV SS, AX
		MOV SP, 16H

		MOV BX, 0
		MOV CX, 4

	S:
		PUSH CX
		MOV SI, 0
		MOV CX, 4
	S1:
		MOV AL, [BX+SI+3]
		AND AL, 11011111B
		MOV [BX+SI+3], AL
		INC SI
		LOOP S1

		ADD BX, 16
		POP CX
		LOOP S

		MOV AH, 4CH
		INT 21H
		
CSEG ENDS
END START




