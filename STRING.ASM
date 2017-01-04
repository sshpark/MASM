CSEG SEGMENT
        assume cs:cseg
        START:
                MOV DL,'?'
                MOV AH,02H
                INT 21H
CSEG ENDS
END START
