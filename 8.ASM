;向内存0:200～0:23f 依次传送数据0～3fh
CSEG SEGMENT
	ASSUME CS: CSEG
	START:
		MOV AX, 0020H
		MOV ES, AX					;定义附加段以存放0～3f
		MOV BX, 0
		MOV CX, 64					;循环次数为64

		S:
			MOV ES:[BX], BX			;把 0～64 送入 0:200 ~ 0:23F
			INC BX
			LOOP S

		MOV AH, 4CH
		INT 21H  					;返回dos
CSEG ENDS
END START