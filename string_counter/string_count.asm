%include "counter.asm"

global start

section .text

start:

    ;;Setup string and count len.
    mov rbx, string
    mov rax, rbx
    call count_string

    ;;Write string 
    mov rdx, rax
    mov rsi, string
    mov rdi, 1
    mov rax, SYS_WRITE
    syscall

    ;;Exit system
    exit


section .data
    string db "Count the string len dynamically.",0xa

