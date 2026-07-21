section .bss
buffer resb 1024

section .text
global _start
_start:
mov rax, 0
mov rdi, 0
mov rsi, buffer
mov rdx, 1024
syscall

mov rbx, rax

mov rcx, 0

.compare:
cmp rcx, rbx
jge .print

mov al, [rcx + buffer]

cmp al, 10
je .next_char

cmp al, 13
je .next_char

xor al, 7 ;I choose 7 as it's not much used, so no one will expect it
mov [buffer + rcx], al

.next_char:
inc rcx
jmp .compare

.print:
mov rax, 1
mov rdi, 1
mov rsi, buffer
mov rdx, rbx
syscall
jmp .exit

.exit:
mov rax, 60
xor rdi, rdi
syscall
