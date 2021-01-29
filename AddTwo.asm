.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:dword
 
.data
myBytes byte 10h,20h,30h,40h
myWords word 8Ah,3Bh,72h,66h
myDoubles dword 1,2,3,4,5
myPointer dword myDoubles
.code
main PROC
  mov esi,offset mybytes
  mov al,[esi]  ; al = 10h
  mov al,[esi+3] ; al = 40h
  mov esi,offset myWords+2
  mov ax,[esi]  ;ax = 3bh
  mov edi,8
  mov edx,[myDoubles+edi] ;edx = 3
  mov edx,myDoubles[edi] ;edx = 3
  mov ebx,myPointer
  mov eax,[ebx+4] ;eax  = 2


  mov esi,offset myBytes
  mov ax,[esi] ;ax = 2010h
  mov eax,dword ptr myWords ;eax = 3b8ah
  mov esi,myPointer  
  mov ax,[esi] ; ax = 1
  mov ax,[esi+4] ; ax = 2
  mov ax,[esi+2] ; ax =0  ×Ö½ÚÊý²»¹»
  mov ax,[esi-4] ; ax = 72h
  invoke ExitProcess,0
main endp
end main