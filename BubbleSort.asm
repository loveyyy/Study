include irvine32.inc


BubbleSort proto, Array:ptr dword,ArraySize:dword
printArray proto, Array2:ptr dword,ArraySize2:dword

.data
Array1 dword 1,3,4,5,7,8,2,6
ArraySize1 = ($ - Array1)/type Array1


.code
	main proc
	invoke BubbleSort, addr Array1,ArraySize1
	invoke printArray, addr Array1,ArraySize1
	exit
	main endp

;---------------------------
	BubbleSort proc uses eax esi ecx,
				Array:ptr dword,
				ArraySize:dword
;-----冒泡排序--------------
;接收参数 数组指针 数组大小
;无返回
	mov ecx,ArraySize
	dec ecx

L1:
	push ecx
	mov esi,Array

L2:	
	mov eax,[esi]
	cmp [esi+4],eax
	jg L3
	xchg eax,[esi+4]
	mov [esi],eax

L3:
	add esi,4
	loop L2

	pop ecx
	loop L1

L4:
	ret

	BubbleSort endp

;---------------------------
	printArray proc uses eax esi ecx,
				Array2:ptr dword,
				ArraySize2:dword
;-----打印数组--------------
;接收参数 数组指针 数组大小
;无返回
	mov esi,Array2
	mov ecx,ArraySize2
L1:
	mov eax,[esi]
	add esi,4
	call writeInt
	loop L1
	call crlf
	ret

	printArray endp

	end main