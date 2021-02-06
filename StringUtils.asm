include irvine32.inc

Strucase PROTO,pstring:ptr byte
Strcompare PROTO, string1:ptr byte,string2:ptr byte
StrLeng PROTO, string4:ptr byte
Strcopy PROTO, source:ptr byte , tager:ptr byte
Strtrim PROTO, pString:ptr byte , char: byte

.data
string_1 byte "abcdef",0
string_2 byte "ABCDEF",0
msg1 byte "����",0
msg2 byte "С��",0
msg3 byte "����",0


.code
	main proc
	invoke Strucase, addr string_1
	mov edx,offset string_1
	call writeString
	call crlf
	invoke Strcompare, addr  string_2, addr string_1
	.if zero?
	mov edx,offset msg1
	.elseif carry?
	mov edx,offset msg2
	.else
	mov edx,offset msg3
	.endif
	call writeString
	call crlf
	exit
	main endp

;------------------------------
	Strcompare proc uses eax edx esi edi,
				string1:ptr byte,
				string2:ptr byte
				
;�Ƚ������ַ���
;�޷���ֵ  �������־λ �ͽ�λ��־λ�ܵ�Ӱ����cmpָ����ͬ
;----------------------------------------------------
	mov esi,string1
	mov edi,string2
L1:
	mov al,[esi]
	mov dl,[edi]
	cmp al,0
	jne L2
	cmp dl,0
	jne L2
	jmp L3

L2:
	inc esi
	inc edi
	cmp al,dl
	je L1

L3:
	ret
	Strcompare endp


;------------------------------
	StrLeng proc uses edi,
			string4:ptr byte
;�ַ�������
;����eax
;----------------------------------------------------
	mov edi,string4
	mov eax,0
L1:
	cmp byte ptr[edi],0
	je L2
	inc edi
	inc eax
	jmp L1
L2:
	ret
	StrLeng endp





;------------------------------
	Strcopy proc uses eax esi ecx edi,
				source:ptr byte,
				tager: ptr byte
				
;�����ַ���
;----------------------------------------------------
	invoke StrLeng,source ;��ȡԴ�ַ�������  �����eax��
	mov ecx,eax
	mov esi,source
	mov edi,tager
	cld
	rep  movsb
	ret
	Strcopy endp


;------------------------------
	Strtrim proc uses eax  ecx edi,
				pString:ptr byte,
				char: byte
				
;���ַ���ĩβɾ������������ָ���ƥ����ַ���
;----------------------------------------------------
	mov edi,pString
	invoke StrLeng,edi
	cmp eax,0
	je L3
	mov  ecx,eax
	dec eax
	add edi,eax

L1:
	mov al,[edi]
	cmp al,char
	jne L2
	dec edi
	loop L1

L2:
	mov byte ptr [edi+1],0
L3:
	ret
	Strtrim endp


	

;------------------------------
	Strucase proc uses eax  esi,
				pstring:ptr byte
;ʹ���ֽڽ������ַ���ת��Ϊ��д
;----------------------------------------------------
	mov esi,pstring
L1:
	mov al,[esi]
	cmp al,0
	je L3
	cmp al,'a'
	jb L2
	cmp al,'z'
	ja L2
	and byte ptr [esi],11011111b
L2:
	inc esi
	jmp L1
L3:
	ret
	Strucase endp


end main
