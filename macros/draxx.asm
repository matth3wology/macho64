;;System exit.
%macro exit 0
    mov rax, 0x2000001
    mov rdi, 0
    syscall
%endmacro 

;;Prints a newline.
%macro newline 0
    mov rax, 0x2000004
    mov rdi, 1
    mov byte[rsi], 0xa
    mov rdx, 1
    syscall
%endmacro

;;Takes in a string and prints with newline.
%macro print 1 
    mov rax, %1
    mov rbx, rax
%%count:
    ;;Loop until 0
    cmp byte[rax], 0
    jz %%finished
    inc rax
    jmp %%count
%%finished:
    ;;Calculate len of string.
    sub rax, rbx
    ;;Print the string
    mov rdx, rax
    mov rsi, %1
    mov rdi, 1
    mov rax, 0x2000004
    syscall

%endmacro

%macro read 1

    mov rax, 0x2000003
    mov rdi, 0
    mov rsi, %1
    mov rdx, 30
    syscall

%endmacro