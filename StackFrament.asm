include irvine32.inc

myProc PROTO, x:DWORD, y:DWORD
.data

.code
	main proc

	mov eax,0EAEAEAEAh
	mov ebx,0EBEBEBEBh

	invoke myProc,1111h,2222h
	exit
	main endp

	;-----------------
	myProc proc uses eax ebx,
		x:dword,y:dword
		local a:dword,b:dword

		PARAMS = 2
		LOCALS = 2
		SAVED_REGS = 2
		mov a,0AAAAh
		mov b,0BBBBh
		invoke WriteStackFrame, PARAMS,LOCALS,SAVED_REGS
		ret
	myProc endp

	end main