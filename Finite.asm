include irvine32.inc

ENTER_KEY = 13

.data
InvalidInputMsg byte "invalid input",13,10,0

.code
	main proc
	call clrscr

stateA:
	call GetNext
	cmp al,'+'
	je stateB
	cmp al,'-'
	je stateB
	call isDigit
	jz stateC
	call DisPlayErrorMsg
	jmp QUIT

stateB:
	call GetNext
	call isDigit
	jz stateC
	call DisPlayErrorMsg
	jmp QUIT

stateC:
	call GetNext
	call isDigit
	jz stateC
	cmp al,ENTER_KEY
	je QUIT
	call DisPlayErrorMsg
	jmp QUIT

QUIT:
	call crlf
	exit
	main endp


	;-----------------------
	GetNext proc
	;�ӱ�׼�����ȡһ���ַ���
	;�ַ�������al�з���
		call readChar
		call writeChar
		ret
	GetNext endp

	;-----------------------
	DisPlayErrorMsg proc
	;��ʾ������Ϣ
		push edx
		mov edx,offset InvalidInputMsg
		call writeString
		pop edx
		ret
	DisPlayErrorMsg endp

end main

