data segment
    str0 db 20 dup('$')
    str1 db 20 dup('$')
    msg1 db 10,13,"enter the string:$"
    msg2 db 10,13,"$"
data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09H
    int 21H
    mov si,offset str0
    call input

   

    mov cl, str0 + 1
    mov si,offset str0 + 2

    next:inc si
         dec cl
         jnz next
    mov cl,str0 + 1
    inc cl
    
    
    mov di,offset str1 + 2
    rev: mov al,[si]
         mov [di],al
         dec si
         inc di
         dec cl
         jnz rev
    mov si,offset str1 + 2
    ;call output

    lea dx,msg2
    mov ah,09H
    int 21H

    mov dx,si
    mov ah,09H
    int 21H

    mov ah,4CH
    int 21h
         



input proc near
    mov dx,si
    mov ah,0Ah
    int 21H
    ret
input endp

;output proc near
   
    ;ret
;output endp

code ends
end start