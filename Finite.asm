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
	;从标准输入读取一个字符串
	;字符保存再al中返回
		call readChar
		call writeChar
		ret
	GetNext endp

	;-----------------------
	DisPlayErrorMsg proc
	;显示错误信息
		push edx
		mov edx,offset InvalidInputMsg
		call writeString
		pop edx
		ret
	DisPlayErrorMsg endp

end main

