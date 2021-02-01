include irvine32.inc


BUFMAX = 128
.data
sPrompt byte "������Ҫ���ܵ��ı�",0
sEncrypt byte "�����ı�",0
sDecrypt byte "�����ı�",0
buffer byte BUFMAX + 1 dup(0)
bufSize dword ?
KEY byte "ABXmv#7"
KEYSize = ($ - KEY)

.code
	main proc
	call inputTheString ;��������
	call translateBuffer ; ���ܻ�����
	mov edx,offset sEncrypt ;��ʾ������Ϣ
	call DisplayMessage
	call translateBuffer ;���ܻ�����
	mov edx,offset sDecrypt ;��ʾ������Ϣ
	call DisplayMessage
	main endp


	;-----------------------------
	inputTheString proc
	; ��ʾ�û����봿�ı��ַ���
	;�����ַ����ͳ���
	;
		pushad
		mov edx,offset sPrompt
		call writeString ;���edx�е��ַ���
		mov ecx,BUFMAX
		mov edx,offset buffer
		call ReadString ;��ȡ����ֽ�Ϊ ecx�е�ֵ�����뵽edx�� ���ȱ��浽eax��
		mov bufSize,eax 
		call crlf
		popad
		ret
	inputTheString endp


	;-----------------------------
	DisplayMessage proc
	; ��ʾ���ܻ��߽��ܵ���Ϣ
	;����edx ָ����Ϣ
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
	;�ַ�����ÿ���ֽ���key�������
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

