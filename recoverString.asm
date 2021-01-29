.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:dword
 
.data
string byte "hello world"
strSize = ($ - string)
.code
main PROC
  mov ecx,strSize
  mov esi,0
L1:
  movzx eax,string[esi]
  push eax
  inc esi
  loop L1

  mov ecx,strSize
  mov esi,0
L2:
  pop eax
  mov string[esi],al
  inc esi
  loop L2
  invoke ExitProcess,0
main endp
end main