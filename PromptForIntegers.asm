include irvine32.inc

.code
;-----------------------------------
PromptForInters proc
;提示用户输入整数 并用用户输入的整数填充数组
;接收 ptrPrompt :PTR byte  提示信息字符串
;	  ptrArray:PTR dword  数组指针
;     arraySize :Dword    数组大小

	enter 0,0  ;  push ebp mov ebp,esp  sub esp,0
	pushad

	mov ecx,[ebp+16] ;arraySize
	cmp ecx,0
	je L2
	mov edx,[ebp+8] ;ptrPrompt
	mov esi,[ebp+12] ;ptrArray

L1:
	call WriteString
	call ReadInt
	call crlf
	mov [esi],eax
	add esi,type dword
	loop L1

L2:
	popad
	leave  ; mov esp ,ebp pop ebp
	ret 12
PromptForInters endp
end

