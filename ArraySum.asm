include irvine32.inc

.code
;--------------------------------
	ArraySum proc
	;����32λ����֮��
	;���� �� ptrArray:PTR dword ����ָ��
	;		 arraySize :dword �����С

	enter 0,0
	push ecx
	push esi

	mov eax,0
	mov ecx,[ebp+12]
	mov esi,[ebp+8]
	cmp ecx,0
	je L2

L1: 
	add eax,[esi]
	add esi,type dword
	loop L1

L2:
	pop ecx
	pop esi
	leave
	ret 8

	ArraySum endp
end
	
