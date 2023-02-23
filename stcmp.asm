data segment
    str1 db 10 dup("$")
    str2 db 10 dup("$")
    msg1 db 10,13,"enter the first string:$"
    msg2 db 10,13,"enter the second string:$"
    msg3 db 10,13,"equal$"
    msg4 db 10,13,"not equal$"
    count1 db ?
    count2 db ?
data ends

code segment

    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09H
    int 21H

    mov si,offset str1
    mov dx,si
    mov ah,0AH
    int 21h


    mov cl,00h
    mov bl,13
    mov si ,offset str1+2
loop1:cmp [si],bl
    je exit1
    inc cl
    inc si
    jmp loop1
exit1:
    mov count1,cl

    

    lea dx,msg2
    mov ah,09H
    int 21H

    mov di,offset str2
    mov dx,di
    mov ah,0AH
    int 21h

    mov di,offset str2+2
    mov ch,00h
    mov bl,13
loop2:cmp [di],bl
    je exit2
    inc ch
    inc di
    jmp loop2
exit2:
    mov count2,ch

    cmp ch,cl
    jne exit3
    mov si,offset str1+2
    mov di,offset str2+2
loop3:    mov al,[di]
    cmp [si],al
    jne exit3
    inc si
    inc di
    dec cl
    jnz loop3

    lea dx,msg3
    mov ah,09H
    int 21H
    jmp exit4

exit3: lea dx,msg4
    mov ah,09H
    int 21H
exit4:
    mov ah,4ch
    int 21H

code ends
end start