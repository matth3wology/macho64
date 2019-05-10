SYS_WRITE equ 0x2000004
SYS_EXIT equ 0x2000001

global start

section .text
start:
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, msg, 
    mov rdx, 13
    syscall

    mov rax, SYS_EXIT
    mov rdi, 0
    syscall

section .data

    msg db 'Connecting..',10


