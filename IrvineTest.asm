include irvine32.inc

.data
 intArray sword 0,0,0,0,1,20,35,-12,66,4,0
 noneMsg byte "A none-zero  value was not found",0
.code
    main proc
    mov ebx,offset intArray
    mov ecx,lengthof intArray
    mov esi,0

L1: cmp word ptr [ebx],20
    je found
    add ebx,2
    inc esi
    loop L1
    jmp noFound

found:
    mov eax,esi
    call writeInt
    jmp quit

noFound:
    mov ebx,offset noneMsg
    call writeString
quit:
    call crlf
    exit
    main endp    
end main