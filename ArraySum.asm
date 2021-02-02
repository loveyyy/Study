include irvine32.inc

.code
;--------------------------------
	ArraySum proc
	;计算32位整数之和
	;接收 ： ptrArray:PTR dword 数组指针
	;		 arraySize :dword 数组大小

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
	
