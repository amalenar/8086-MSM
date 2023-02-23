MOV SI,OFFSET STRING
 
 ; traverse to the end of;
 ;the string
 LOOP1 :
    MOV AX, [SI]
    CMP AL, '$'
    JE LABEL1
    INC SI
    JMP LOOP1
 
 ;load the starting address;
 ;of the string
 LABEL1 :
    MOV DI,OFFSET STRING
    DEC SI
 
    ; check if the string is palindrome;
    ;or not
    LOOP2 :
     CMP SI, DI
     JL OUTPUT1
     MOV AX,[SI]
     MOV BX, [DI]
     CMP AL, BL
     JNE OUTPUT2
 
    DEC SI
    INC DI
    JMP LOOP2
 
 OUTPUT1:LEA DX,STRING1
 
    ; output the string;
    ;loaded in dx
    MOV AH, 09H
    INT 21H
    RET
 
 OUTPUT2:
    ;load address of the string
    LEA DX,STRING2
 
    ; output the string
    ; loaded in dx
    MOV AH,09H
    INT 21H
    RET