data segment
    str1 db 20 dup('a')
    msg1 db 10,13,"enter the string:$"
    msg2 db 10,13,"not palindrome$"
    msg3 db 10,13,"is palindrome$"

code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09H
    int 21H
    mov si , offset str1
    call input

    mov cl,str1+1
    
    mov si,offset str1 + 2

    next:
        inc si
        dec cl
        jnz next

   
    dec si
    mov di,offset str1 + 2

    loop2 :
        cmp si,di
        jl output1
        mov ax,[si]
        mov bx,[di]
        cmp al, bl
        jne output2
 
        dec si
        inc di
        jmp loop2
   

   output1: lea dx,msg3
            mov ah,09H
            int 21H
            jmp complete

    output2:lea dx,msg2
            mov ah,09H
            int 21H

   complete: mov ah,4CH
             int 21H


input proc near
    mov dx,si
    mov ah,0ah
    int 21H
    ret
input endp

code ends
end start
