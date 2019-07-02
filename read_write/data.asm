bits 64
global start

section .text
start:

    call mkdir
    call exit

mkdir:
    ; mkdir(directory, permissions)
    mov rax, 0x2000088
    mov rdi, directory
    mov rsi, 0755o
    syscall

    ret

exit:
    ; exit(0)
    mov rax, 0x2000001
    mov rdi, 0
    syscall

section .data
    directory: db 'tmp',0