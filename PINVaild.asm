include irvine32.inc

.data
PIN dword 9,9,6,4,3
;PIN byte 54444
MAX dword 9,5,8,4,6
MIN dword 5,2,4,1,3
index = ($ - MAX)
SUC byte "成功",0
FAI byte "失败",0

.code
	main proc
	mov eax, offset PIN
	call VaildPin
	.if eax == 0
		mov edx, offset SUC
	.else
		mov edx,offset FAI
	.endif
	call writeString
	exit
	main endp

	;------------------
	VaildPin proc
	;检查pin得值
	push ecx
	push edx
	push esi
	
	mov esi,0
	mov ecx,index
L1:
	mov edx,[eax]
		.if (edx > MAX[esi])||(edx<MIN[esi])
			mov eax,esi
			pop ecx
			pop esi
			pop edx
			ret 
		.else
			inc esi
			inc eax
			dec ebx
		.endif
	loop L1

	mov eax,0
	pop esi
	pop edx
	pop ecx
	ret
	VaildPin endp


end main