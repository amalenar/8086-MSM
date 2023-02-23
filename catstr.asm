data segment
    str1 db 20 dup("$")
    str2 db 20 dup("$")
    msg1 db 10,13,"enter the first string:$"
    msg2 db 10,13,"enter the second string:$"
    msg3 db 10,13,"enter the concatenated string:$"
data ends

code segment
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21h                                                             
    mov si,offset str1
    mov ah,0Ah
    mov dx,si
    int 21h
    
                                                    
    mov cl,str1+1
    mov si,offset str1+2

    lea dx,msg2
    mov ah,09h
    int 21h
    mov di,offset str2
    mov ah,0Ah
    mov dx,di
    int 21h
    
    mov bl,00h
    mov al,13
loop3:cmp [di],al
    je exit1
    inc bl
    inc di
    jmp loop3

exit1:
mov di,offset str2+2

loop1:inc si
dec cl
jnz loop1

loop2:   mov al,[di]
    mov [si],al
    inc si
    inc di
    dec bl
    jnz loop2

mov si,offset str1+2

    lea dx,msg3
    mov ah,09h
    int 21h

    mov ah,09h
    mov dx,si
    int 21h

    mov ah,4ch
    int 21h

code ends
end start
    