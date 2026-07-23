[bits 16]
[org 0x1000]

kernel_start:
    mov ah, 0x0e
    mov si, msg

.loop:
    lodsb        
    int 0x10
    jmp .loop

halt:
    cli
    hlt
    jmp halt

msg db "Bootloader work!", 0x0d, 0x0a, 0

times 1536 - ($ - $$) db 0