data segment   
    num1 db ?
    num2 db ?
    product db ?
    msg1 db 10,13,"enter the first=$"
    msg2 db 10,13,"enter the second=$"
    msg3 db 10,13,"product is =$"
data ends

code segment
    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09H
        int 21H
        call input

        mov num1,al

        lea dx,msg2
        mov ah,09H
        int 21H
        call input

    ;     mov bl,al
    ;     mov dl,num1
    ;     mov ax,0H
    ; loop1:    
    ;     add ax,dx
    ;     daa
    ;     dec bl
    ;     cmp bl,0h 
    ;     jne loop1
        mov bl,num1
        mul bl
        mov product,al

        mov ah,09H
        lea dx,msg3 
        int 21h

        lea si,product
        call output

        mov ah,4CH
        int 21H

input proc near
    mov ah,01H
    int 21H
    sub al,30H
    cmp al,09h
    jle skip1
    sub al,07H
skip1:
    mov cl,04H
    rol al,cl
    mov ch,al

    mov ah,01H
    int 21H
    sub al,30h
    cmp al,0Ah
    jle skip2
    sub al,07H
skip2:
    add al,ch
    
ret
input endp
output proc near
    mov al,[si]
    and al,0f0H
    mov cl,04H
    ror al,cl
    add al,30H
    cmp al,39H
    jle skip3
    add al,07h
skip3:mov dl,al
      mov ah,02H
      int 21h

    mov al,[si]
    and al,0fH
    add al,30H
    cmp al,39H
    jle skip4
    add al,07h
skip4:
    mov dl,al
    mov ah,02H
    int 21H

;  mov ax,[si]
;     and al,0f0H
;     mov cl,04H
;     rol al,cl
;     add al,30H
;     cmp al,3AH
;     jle skip5
;     add al,07h
; skip5:mov dl,al
;       mov ah,02H
;       int 21h

;  mov ax,[si]
;     and al,0fH
;     add al,30H
;     cmp al,3AH
;     jle skip4
;     add al,07h
; skip6:
;     mov dl,al
;     mov ah,02H
;     int 21H

ret
output endp

code ends
end start
