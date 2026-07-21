section .bss
buffer resb 1024

section .text
global _start
_start:
mov eax, 3
mov ebx, 0
mov ecx, buffer
mov edx, 1024
int 0x80
mov esi, eax
xor ecx, ecx

.compare:
cmp ecx, ebx
jge .print

mov al, [ecx + buffer]
je .next_char

xor al, 7
mov [buffer + ecx], al

.next_char:
inc ecx
jmp .compare

.print:
mov eax, 4
mov ebx, 1
mov ecx, buffer
mov edx, esi
int 0x80
mov eax, 1
xor ebx, ebx
int 0x80
