include irvine32.inc


.data
count = 100
array word count dup(?)

.code
	main proc
		push offset array
		push count
		call ArrayFill
		exit
	main endp

	;---------------------
	ArrayFill proc
	;�������
		push ebp
		mov ebp,esp
		pushad
		mov esi,[ebp+12];�����õ�������ָ��
		mov ecx,[ebp+8] ;�����������鳤��
		cmp ecx,0
		je L2

	L1:
		mov eax,10000h
		call RandomRange
		mov [esi],ax 
		add esi,2
		loop L1
	L2:
		popad
		pop ebp
		ret 8  ;�����ջ

	ArrayFill endp

	end main