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
	;填充数组
		push ebp
		mov ebp,esp
		pushad
		mov esi,[ebp+12];这里获得的是数组指针
		mov ecx,[ebp+8] ;这里获得是数组长度
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
		ret 8  ;清除堆栈

	ArrayFill endp

	end main