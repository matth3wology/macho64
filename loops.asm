
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

    xor rbx,rbx
    call l1

    call end_message
    exit

l1:
    call loop_message
    inc rbx
    cmp rbx, 3
    jle l1
    ret

loop_message:
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, loop_msg
    mov rdx, 10
    syscall
    ret

end_message:
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, end_loop
    mov rdx, 9
    syscall
    ret

section .data
    loop_msg db 'Looping..',10
    end_loop db 'Exiting.',10
