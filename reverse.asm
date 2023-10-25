section .data
msg db 'Manya'
len1: equ $-msg

section .bss
rstring resb 10;

section .code
global _start
_start:
	%macro write 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
	%endmacro
	
	mov esi,msg; source index register(16bits)
	mov ecx,10
	add esi,len1-1
	mov edi, rstring; destination index register(16bits)
	
	Again:  mov eax,[esi]
		mov [edi],eax
		dec esi
		inc edi
		LOOP Again; used for looping
		
		write rstring,10
		mov eax,1
		mov ebx,0
		int 80h
	
	
