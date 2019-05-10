

section .text

global start

start:
    mov rax, 0x2000004
    mov rdi, 1
    mov rdx, msg, 
    mov rcx, 13
    syscall

    mov rax, 0x2000001
    mov rdi, 0
    syscall

section .data

    msg db 'Connecting..',10

