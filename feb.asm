data segment 
    a db 0
    b db 1
    c db ?
    msg1 db 10,13,"enter  no:$"
    msg2 db 10,13,"febonacci series:$"
data ends

code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09H
    int 21h
    call hex

    mov cl,al

    lea dx,msg2
    mov ah,09H
    int 21h

    mov al,a
    call ascii
    mov dl,al
    mov ah,02H
    int 21h

    mov al,b
    call ascii
    mov dl,al
    mov ah,02H
    int 21h

    loop1:
            mov al,a
            mov bl,b
            add al,bl
            daa
            call hex

            mov dl,al
            mov ah,02H
            int 21H

            mov al,b
            mov a,al
            mov al,c
            mov b,al

            dec cl
            jnz loop1

    mov ah,4CH
    int 21H



ascii proc near
    add al,30h
    cmp al,39h
    jle skip
    add al,07h
    skip:ret 
ascii endp

hex proc near
    
    mov ah,01h
    int 21H
    sub al,30h
    cmp al,09H
    jle skip1
    sub al,07h
    skip1:ret
hex endp

code ends
end start