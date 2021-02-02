include irvine32.inc


.data
.code
	main proc
	mov ecx,5
	mov eax,0
	call CalcSum
	call writeDec
	call crlf
	exit
	main endp

	;-------------------
	CalcSum proc
	;µ›πÈº∆À„∫Õ
	;-------------
	cmp ecx,0
	je L2
	add eax,ecx
	dec ecx
	call CalcSum
L2:
	ret
	CalcSum endp

	end main 