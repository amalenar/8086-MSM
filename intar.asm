data segment
    str1 db 10 dup(?)
    count db ?
    msg1 db 10,13,"Enter elements:$"
    msg2 db 10,13,"sorted elements:$"

data ends

code segment

    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09h
        int 21H
        
        mov bl,13
        mov si,offset str1
        mov cl,00h
     loop1:   mov ah,01h
        int 21H
        cmp al,bl
        je exit1
        mov [si],al
        inc si
        inc cl
        jmp loop1
       
    exit1:
        
         mov count,cl
         dec cl
    loop3:mov bl,cl
          mov si,offset str1
         
    loop2:mov al,[si]
         inc si
         cmp al,[si]
         jge skip1
         inc si
         dec bl
         jnz loop2
         jmp loop4

skip1:  mov bh,[si]
        mov [si],al
        dec si
        mov [si],bh
        inc si
        dec bl
        jnz loop2

    loop4:   dec cl
        jnz loop3


    lea dx,msg2
    mov ah,09H
    int 21h
    mov si,offset str1
        mov dx,si
        mov ah,09H
        int 21H

    
    mov ah,4ch
    int 21H

    code ends
    end start