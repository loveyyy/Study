include irvine32.inc

.code
;-----------------------------------
PromptForInters proc
;��ʾ�û��������� �����û�����������������
;���� ptrPrompt :PTR byte  ��ʾ��Ϣ�ַ���
;	  ptrArray:PTR dword  ����ָ��
;     arraySize :Dword    �����С

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

