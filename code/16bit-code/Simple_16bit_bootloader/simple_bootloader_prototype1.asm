[bits 16]
[org 0x7c00]

_start:
mov ah, 0x0e
mov al, '1'; 1 == works
int 0x10
halt:
hlt
jmp halt

times 510 - ($ - $$) db 0
dw 0xaa55
