include irvine32.inc


BUFMAX = 128
.data
sPrompt byte "输入需要加密的文本",0
sEncrypt byte "加密文本",0
sDecrypt byte "解密文本",0
buffer byte BUFMAX + 1 dup(0)
bufSize dword ?
KEY byte "ABXmv#7"
KEYSize = ($ - KEY)

.code
	main proc
	call inputTheString ;输入明文
	call translateBuffer ; 加密缓冲区
	mov edx,offset sEncrypt ;显示加密消息
	call DisplayMessage
	call translateBuffer ;解密缓冲区
	mov edx,offset sDecrypt ;显示解密消息
	call DisplayMessage
	main endp


	;-----------------------------
	inputTheString proc
	; 提示用户输入纯文本字符串
	;保存字符串和长度
	;
		pushad
		mov edx,offset sPrompt
		call writeString ;输出edx中的字符串
		mov ecx,BUFMAX
		mov edx,offset buffer
		call ReadString ;读取最大字节为 ecx中的值的输入到edx中 长度保存到eax中
		mov bufSize,eax 
		call crlf
		popad
		ret
	inputTheString endp


	;-----------------------------
	DisplayMessage proc
	; 显示加密或者解密的消息
	;接受edx 指向消息
	;
		pushad
		call writeString
		mov edx,offset buffer
		call writeString
		call crlf
		popad
		ret
	DisplayMessage endp


	;-----------------------------
	translateBuffer proc
	;字符串的每个字节与key进行异或
		pushad
		mov ecx,bufSize
		mov esi,0
		mov ebx,keySize
	L1:
		mov eax,esi
		.if esi == 0
			mov edi,0
		.elseif eax > ebx
			div bl
			movzx edi,ah
		.else
			mov edi,esi
		.endif
		movzx edx,KEY[edi]
		xor buffer[esi],dl
		inc esi
		loop L1
		popad
		ret
	translateBuffer endp

end main

