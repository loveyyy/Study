include irvine32.inc

.code
;---------------------------
	DisplaySum proc
; 显示和数到控制台
; 接收  ptrPrompt  提示字符串的指针
;       theSum     和数
	enter 0,0
	push eax
	push edx

	mov edx,[ebp+8]
	call writeString
	mov eax,[ebp+12]
	call writeInt
	call crlf

	pop edx
	pop edx
	leave
	ret 8

	DisplaySum endp
end