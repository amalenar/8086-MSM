data segment
    str1 db 20 dup("$")
    str2 db 20 dup("$")
    msg1 db 10,13,"enter the string:$"
    msg2 db 10,13,"reversed string:$"
    count db ?
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
    skip1:    cmp [si],bl
        je skip2
        inc cl
        inc si
        jmp skip1

    skip2:
            mov count,cl

        mov si,offset str1

    loop1:
        inc si
        dec cl
        jnz loop1
        
        mov cl,count
        inc si
    
        mov di,offset str2

    loop2:mov bh,[si]
        mov [di],bh
        dec si
        inc di
        dec cl
        jnz loop2

        lea dx,msg2
        mov ah,09h
        int 21h
        
        mov di,offset str2+2

        
        mov ah,09h
        mov dx,di
        int 21h

        mov ah,4ch
        int 21h

code ends
end start

