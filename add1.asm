data segment
    num1 db ?
    num2 db ?
    sum db ?
    msg1 db 10,13,"enter the first number=$"
    msg2 db 10,13,"enter the second number=$"
    msg3 db 10,13,"result =$"

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
    mov bl,al

    lea dx,msg2
    mov ah,09H
    int 21H
    call input

    add al,bl 
    daa
    mov sum,al

    mov ah,09H
    lea dx,msg3
    int 21h

    lea si,sum
    call output

    mov ah,4CH
    int 21H


input proc near
    mov ah,01H
    int 21H
    sub al,30H
    cmp al,09h
    jle skip1
    sub al,07h
skip1:mov cl,04H
    rol al,cl
    mov ch,al

    mov ah,01H
    int 21H
    sub al,30H
    cmp al,09H
    jle skip2
    sub al,07h
skip2:add al,ch
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
    add al,07H
skip3:mov dl,al
    mov ah,02H
    int 21H

    mov al,[si]
    and al,0fH
    add al,30H
    cmp al,39H
    jle skip4
    add al,07H
skip4:mov dl,al
    mov ah,02H
    int 21H
ret
output endp

code ends
end start

