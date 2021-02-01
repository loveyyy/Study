include irvine32.inc

.data

array dword 10,60,20,33
sample dword 50
arraySize = ($ - array)/type array

.code
;------------------------------------
;计算大于sample得值得总和
;eax sum   esi index
	main proc
	mov edx,sample
	mov ecx,arraySize
	mov eax,0
	mov esi,0
L:
	cmp esi,ecx
	jnl L3
	cmp array[esi*4],edx
	jng L2
	add eax,array[esi*4]
	jmp L2
L2:
	inc esi
	jmp L
L3:
	call writeInt
	exit
	main endp
end main