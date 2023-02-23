data segment
    
    msg1 db 10,13,"enter the first no:$"
    
    msg2 db 10,13,"enter second number:$"
    msg3 db 10,13,"average:$"
    msg4 db 10,13,"sum:$"
    num1 db ?
    sum db ?
    avg db ?
data ends

code segment

    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21H
    call input
    mov num1,al

    lea dx,msg2
    mov ah,09h
    int 21H
    call input

    mov bl,num1

    add al,bl
    mov sum,al
    mov bl,sum
    lea dx,msg4
    mov ah,09h
    int 21H

   lea si,sum
   call output

   mov ah,00h
   mov al,sum
   mov bl,02h
   mov cl,00h
   div bl
   mov avg,al

; mov cl,00h
; skip5:sub bl,02h
;     inc cl           //change
;    cmp bl,02h
;    jge skip5

    lea dx,msg3
    mov ah,09h
    int 21H

   
    

   lea si,avg
   call output

   

    mov ah,4ch
    int 21H

input proc near
    mov ah,01h
    int 21H
    sub al,30h
    cmp al,09h
    jle skip1
    sub al,07h
skip1:mov cl,04h
      rol al,cl
      mov ch,al
    
    mov ah,01h
    int 21H
    sub al,30h
    cmp al,09h
    jle skip2
    sub al,07h 
skip2:add al,ch
    ret

input endp

output proc near
    mov al,[si]
    and al,0f0h
    mov cl,04h
    ror al,cl
    add al,30h
    cmp al,39h
    jle skip3
    add al,07h
skip3:mov ah,02h
    mov dl,al
    int 21H

    mov al,[si]
    and al,0fh
    add al,30h
    cmp al,39h
    jle skip4
    add al,07h
skip4:mov ah,02h
    mov dl,al
    int 21H

    ret

output endp


code ends
end start