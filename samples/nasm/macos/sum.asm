global start

section .data
	; Define constants
	num1:	equ 100
	num2:	equ 50
	; Initialize message
	msg:	db "Sum is correct"

section .text

;; Entry point
start:
	; Set num1's value to rax
	mov rax, num1
	; Set num2's value to rbx
	mov rbx, num2
	; Get sum of rax and rbx, and store it's value in rax
	add rax, rbx
	; Compare rax and 150
	cmp rax, 150
	; Go to .exit label if rax and 150 are not equal
	jne .exit
	; Go to .rightSum label if rax and 150 are equal
	jmp .rightSum

; Print message that sum is correct
.rightSum:
	;; Write syscal
	mov rax, 0x2000004
	;; File descriptor, standart output
	mov rdi, 1
	;; Message address
	mov rsi, msg
	;; Message length
	mov rdx, 15
	;; Call write syscall
	syscall
	; Exit from program
	jmp .exit

; Exit procedure
.exit:
	; Exit syscall
	mov rax, 0x2000001
	; Exit code
	mov rdi, 0
	; Call ext syscall
	syscall

