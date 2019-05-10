
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

    ;;Pop argv[1] and convert to int
    add rsp, 8
    pop rsi
    call string_convert

    ;;Compare the argument with 4
    mov r10, rax
    cmp r10, 4
    je correct_message

    ;;Exit Program
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

string_convert:
        xor rax, rax ;; Zero out rax
        mov rcx,  10 ;; rcx is used for base 10
next:
	    cmp [rsi], byte 0 ;; compare the first byte of rsi
	    je return_str ;; Return if zero
	    mov bl, [rsi] ;; move one byte of rsi into a one byte register
        sub bl, 48 ;; convert string to int
	    mul rcx ;; multiply rax by 10 ex: 3 to 30
	    add rax, rbx ;; add rbx ro rax
	    inc rsi ;; move to the next byte of rsi
	    jmp next ;; loop

return_str:
	    ret


section .data
    error db "Need an argument.",10
    correct db "Correct argument!",10
