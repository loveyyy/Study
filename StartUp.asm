include irvine32.inc

extern PromptForInters@0:proc
extern  ArraySum@0:proc
extern DisplaySum@0:proc


PromptForInters    equ  PromptForInters@0
ArraySum    equ  ArraySum@0
DisplaySum    equ  DisplaySum@0

Count = 3

.data
prompt byte "������һ������:",0
prompt1 byte "����Ľ����:",0
array dword Count dup(?)
sum dword ?


.code
	main proc
	call clrscr

	push Count
	push offset array
	push offset prompt
	call PromptForInters@0

	push Count
	push offset array
	call ArraySum
	mov sum,eax

	push sum
	push offset prompt1
	call DisplaySum

	call crlf
	exit
	main endp

end main

