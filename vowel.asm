data segment
    str1 db 10 dup("aeiou$")
    str2 db 10 dup("$")
    msg1 db 10,13,"enter the string:$"
    msg2 db 10,13,"no of vowels:$"
    count db ?
    vocount db ?
data ends

code segment
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    
    mov cl, 00h
    mov vocount, cl
    lea dx,msg1
    mov ah,09H
    int 21H

    mov si,offset str2
    
    mov ah,0AH
    mov dx,si
    int 21H

    mov cl,00h
    mov bl,13
    mov si,offset str2+2
loop1:cmp [si],bl
    je exit1
    inc cl
    inc si
    jmp loop1

exit1: 
    
    
    mov si,offset str1+2
    mov di,offset str2+2

    mov al,05h
    mov bl, 00h
loop2:mov ch,[di]
    cmp [si],ch
    je gocount
    inc si
    dec al
    jnz loop2
    inc di
    mov si, offset str1 +2
    dec cl
    jnz loop2
    jmp go
gocount: inc bl
         inc di
         mov al, 05h
         mov si, offset str1 + 2
         dec cl
         jnz loop2

go: lea dx,msg2
    mov ah,09H
    int 21H
    
    mov al,bl
    
    
    add al, 30h
    cmp al, 39h
    jle loop6
    add al, 07h
    loop6:
    mov dl,al
    mov ah,02h
    int 21h

    mov ah,4ch
    int 21H

code ends
end start
