data segment
    str1 db 10 dup("$")
    str2 db 10 dup("$")
    msg1 db 10,13,"enter the first string:$"
    
    msg3 db 10,13,"palindrome$"
    msg4 db 10,13,"not palindrome$"
    count db ?
    count2 db ?
data ends

code segment

    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21H

    mov si,offset str1
    mov dx,si
    mov ah,0Ah
    int 21H

    mov si,offset str1+2
    mov cl,00h
    mov bl,13
lengthloop:cmp [si],bl
    je exit1
    inc cl
    inc si
    jmp lengthloop
exit1:
    mov count,cl

    mov di,offset str1+2
    dec si

compareloop:mov bl,[di]
    cmp [si],bl
    jne exit2
    inc di
    dec si
    dec cl
    jnz compareloop
    lea dx,msg3
    mov ah,09h
    int 21H
    jmp out1
exit2:
    lea dx,msg4
    mov ah,09h
    int 21H

out1:

    mov ah,4ch
    int 21H

code ends
end start