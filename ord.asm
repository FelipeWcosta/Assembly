.MODEL SMALL
.STACK 100H
.DATA
    VET DB 1, 3, 5, 4, 7, 9
    CONT DW 6
.CODE
MAIN PROC NEAR
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, CONT

    LACO_I:
        MOV CX, CONT
        MOV SI, OFFSET VET
        LACO_K:
            MOV AL, VET[SI]
            MOV DL, VET[SI+1]
            CMP AL, DL
            JL INCREMENTAR
            MOV VET[SI], DL
            MOV VET[SI+1], AL

            INCREMENTAR:
                INC SI
                LOOP LACO_K
        DEC DX
        JNZ LACO_I
    MOV AH, 4H
    INT 21H
MAIN ENDP
END MAIN