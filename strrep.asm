data segment
    str1 db 20 dup("$")
    msg1 db 10,13,"enter the string:$"
    msg2 db 10,13,"enter character to be replaced:$"
    msg3 db 10,13,"enter replacing character:$"
    msg4 db 10,13,"new string=$"
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
    mov ah,0AH
    mov dx,si
    int 21h

    mov cl,00h
    mov bl,13
loop1:  cmp [si],bl
    je exit1
    inc bl
    inc si
    jmp loop1
exit1:

    mov si,offset str1+2


    lea dx,msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    mov ch,al

    lea dx,msg3
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
   
loop3:    cmp [si],ch
    je exit2
    inc si
    dec cl
    jnz loop3

exit2:
    mov [si],al
    mov si,offset str1+2

    lea dx,msg4
    mov ah,09h
    int 21h

    mov dx,si
    mov ah,09h
    int 21h

   mov ah,4ch
   int 21h





code ends
end start