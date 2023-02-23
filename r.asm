data segment
    char1 db ?
    char2 db ?
    msg1 db 10,13,"enter the string:$"
    msg2 db 10,13,"enter the letter to replace:$"
    msg3 db 10,13,"enter letter to be replaced:$"
    msg4 db 10,13,"new string:$"
    str1 db 20 dup('$')
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
            call input

            lea dx,msg2
            mov ah,09H
            int 21h
            mov ah,01h
            int 21h
            mov char1,al

            lea dx,msg3
            mov ah,09H
            int 21h
            mov ah,01h
            int 21h
            mov char2,al
            mov bh,char2
            mov cl,str1+1
            mov si,offset str1+2
            
            next:
            mov al,[si]
            cmp al,char1
            jne skip
            mov [si],bh
            skip:
            inc si
            dec cl
            jnz next


            lea dx,msg4
            mov ah,09H
            int 21h
            
            mov si,offset str1+2
            mov dx,si
            mov ah,09H
            int 21h

            mov ah,4CH
            int 21H




input proc near 
    mov dx,si
    mov ah,0ah
    int 21H
    ret
input endp

code ends
end start