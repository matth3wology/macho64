%include "counter.asm"

section .data
    string db "Count the string len dynamically.",0xa

section .text

global start

start:

    mov rbx, string
    mov rax, rbx
    call count_string

    mov rdx, rax
    mov rsi, string
    mov rdi, 1
    mov rax, SYS_WRITE
    syscall
    exit
