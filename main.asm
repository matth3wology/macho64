
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

    ;;Check and count arguments.
    pop r10
    cmp r10, 2
    jl error_message

    add rsp, 8
    pop rsi
    call str_to_int

    mov r10, rax
    cmp r10, 4
    je correct_message

    exit

error_message:
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, error
    mov rdx, 18
    syscall
    exit

correct_message:
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, correct
    mov rdx, 18
    syscall
    exit

str_to_int:
        xor rax, rax
        mov rcx,  10
next:
	    cmp [rsi], byte 0
	    je return_str
	    mov bl, [rsi]
            sub bl, 48
	    mul rcx
	    add rax, rbx
	    inc rsi
	    jmp next

return_str:
	    ret


section .data
    error db "Need an argument.",10
    correct db "Correct argument!",10
