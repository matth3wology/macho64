    SYS_WRITE equ 0x2000004
    SYS_EXIT equ 0x2000001

%macro exit 0
    mov rax, SYS_EXIT
        mov rdi, 0
        syscall
%endmacro

count_string:
    cmp byte[rax],0
    jz count_string_done
    inc rax
    jmp count_string

count_string_done:
    sub rax, rbx
    ret