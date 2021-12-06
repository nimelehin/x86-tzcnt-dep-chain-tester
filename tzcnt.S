.text
.globl _runbench

_runbench:
	push rbp
	xor edx, edx
	mov ecx, 1
_benchloop:
	div ecx
	tzcnt eax, ebx
	add ecx, 1
	cmp ecx, 16
	jle _benchloop
	pop	rbp
	ret
