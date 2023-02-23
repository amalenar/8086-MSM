
data segment
	msg1 DB 10,13,"ENTER NUMBER 1:$"
	msg2 DB 10,13,"ENTER NUMBER 2:$"
	msg3 DB 10,13,"SUM IS:$"
	num1 DB ?
	num2 DB ?
	sum DB ?
data ends
code segment
	ASSUME cs:code,DS:data

	START:
	mov ax,data
	mov ds,ax

	lea dx,msg1
	mov ah,09h
	int 21h
	call input
	mov num1,al

	lea dx,msg2
	mov ah,09h
	int 21h
	call input
	
	add al,num1
	daa
	mov sum,al
	
	lea dx,msg3
	mov ah,09h
	int 21h
	lea si,sum
	call output

	mov ah,4CH
	int 21h
	
	

input proc near
	mov ah,01h
	int 21h
	sub al,30h
	cmp al,09h
	jle skip1
	sub al,07h
	skip1:mov cl,04h
	rol al,cl
	mov ch,al

	mov ah,01h
	int 21h
	sub al,30h
	cmp al,09h
	jle skip2
	sub al,07h
	skip2:add al,ch
	ret

input endp

output proc near
	mov ax,[si]
	and al,0f0h
	rol al,cl
	add al,30h
	cmp al,39h
	jle skip3
	add al,07h
	skip3:mov dl,al
	mov ah,02h
	int 21h
	
	mov ax,[si]
	and al,0fh
	add al,30h
	cmp al,39h
	jle skip4
	add ah,07h
	skip4:mov dl,al
	mov ah,02h
	int 21h
	ret
output endp
code ends
end start	 
	
	
	
	
	
	