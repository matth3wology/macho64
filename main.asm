
SYS_WRITE equ 0x2000004
SYS_EXIT equ 0x2000001

%macro exit 0
    mov rax, SYS_EXIT
        mov rdi, 0
        syscall
%endmacro

global start

section .text
start:

    mov rbx, 10
    cmp rbx,3
    jl less_than

    call greater_than

less_than:
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, msgl
    mov rdx, 21
    syscall

    exit

greater_than:
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, msgg
    mov rdx, 24
    syscall

    exit

section .data
    msgl db 'Number is less than.',10
    msgg db 'Number is greater than.',10


