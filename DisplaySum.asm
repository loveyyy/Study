include irvine32.inc

.code
;---------------------------
	DisplaySum proc
; ��ʾ����������̨
; ����  ptrPrompt  ��ʾ�ַ�����ָ��
;       theSum     ����
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