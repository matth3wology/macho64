%include "counter.asm"

section .data
    string db "Count the string len dynamically.",0xa

section .text

global start

start:

    ;Move String to RBX & RAX
    mov rbx, string
    mov rax, rbx
    call count_string

    ;Print out the message
    mov rdx, rax
    mov rsi, string
    mov rdi, 1
    mov rax, 0x2000004
    syscall

    ;System Exit
    mov rax, 0x2000001
    mov rdi, 0
    syscall
