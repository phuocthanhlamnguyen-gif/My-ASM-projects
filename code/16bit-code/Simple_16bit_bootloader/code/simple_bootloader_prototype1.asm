[bits 16]
[org 0x7c00]

_start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti

    ; 2. Print Loop
    mov ah, 0x0e
    mov si, msg

.loop:
    lodsb           
    test al, al     
    jz halt         
    int 0x10        
    jmp .loop

halt:
    hlt
    jmp halt

msg db "Bootloader work!", 0x0d, 0x0a, 0

times 510 - ($ - $$) db 0
dw 0xaa55
