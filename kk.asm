loop1: mov ch,[di]
 cmp [si],ch
 je gocount
 inc si
 dec al
 jnz loop1
inc di
mov si,offset str1
dec cl
jnz loop1
jmp go

 gocount:inc bl
 inc di
 mov si,offset str1
 mov al,05h
 dec cl
 jnz loop1

go:
print aascii

loop4:mov bl,cl
mov si,offset str1+2

loop1:mov al,[si]
inc si
cmp al,[si]
jge skip
inc si
dec bl
jnz  loop1
dec cl
jnz loop4
jmp  loop2

skip:mov bh,[si]
mov [si],al
dec si
mov [si],bh
inc si
dec bl
jnz loop1
dec cl
jnz loop4

loop2: print