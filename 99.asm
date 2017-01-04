section .data
	hello: 		db 		'Hello World!', 0x0a
	helloLen: 	equ	 	$-hello
section .text
	global _main

	kernel:
		syscall
		ret
_main:
	mov 	rax, 0x2000004
	mov 	rdi, 1
	mov 	rsi, hello
	mov 	edx, helloLen
	call 	kernel
	mov 	rax, 0x2000001
	mov 	rdi, 0
	call 	kernel
