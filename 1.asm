DSEG SEGMENT
	VAR1 DB 0FFH		;�����һ������
	VAR2 DB 0FFH		;����ڶ�������
	VAR3 DD ?			;����һ��˫�ֱ���
DSEG ENDS

CSEG SEGMENT
	ASSUME CS:CSEG, DS:DSEG
	START:
		MOV AX, DSEG
		MOV DS, AX
		MOV AH, VAR1
		MOV AL, AH
		MUL AH
		MOV DX, AX
		MOV AL, VAR2
		MOV AH, AL
		MUL AH				;����al * ah �Ĳ������� y ��ƽ��
		ADD DX, AX			;���� x2 + y2 �Ĳ���
		MOV WORD PTR VAR3, DX			;��������var3�����ĵ��֡�
		MOV DX, 0000H
		ADC DX, 0000H					;�õ���λ
		MOV WORD PTR VAR3 + 2, DX
		MOV 4CH
		INT 21H
CSEG ENDS
END START
		
