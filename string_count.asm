
section .data
    string db "Count the string len dynamically.",0xa

section .text

global start

start:

    mov rbx, string
    mov rax, rbx    
    
count:
    cmp byte[rax],0
    jz count_done
    inc rax
    jmp count

count_done:
    sub rax, rbx

    mov rdx, rax
    mov rsi, string
    mov rdi, 1
    mov rax, 0x2000004
    syscall

    mov rax, 0x2000001
    mov rdi, 0
    syscall