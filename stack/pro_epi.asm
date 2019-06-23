
%macro exit 0
    mov rax, 0x2000001
    mov rdi, 0
    syscall
%endmacro 

%macro print 1 
        mov rax, %1
        mov rbx, rax
    %%count:
        ;Loop Until 0
        cmp byte[rax], 0
        jz %%finished
        inc rax
        jmp %%count
    %%finished:
        ;Calculate len of string
        sub rax, rbx
        ;Print the String
        mov rdx, rax
        mov rsi, %1
        mov rdi, 1
        mov rax, 0x2000004
        syscall
%endmacro

%macro prologue 0
    push rbp
    mov rbp, rsp
%endmacro

%macro epilogue 0
    mov rsp, rbp
    pop rbp
    ret
%endmacro

%macro newline 0
    mov rax, 0x2000004
    mov rdi, 1
    mov byte[rsi], 0xa
    mov rdx, 1
    syscall
%endmacro

section .data

    m1: db "Connecting..",0xa,0
    m2: db "Request..",0xa,0
    m3: db "Established..",0xa,0
    m4: db "Sending..",0xa,0

section .text

    global start
    start:

        ; Push Data to the Stack
        mov rax, m4
        push rax

        mov rax, m3
        push rax

        mov rax, m2
        push rax

        mov rax, m1
        push rax

        ; Call function that prints the stack
        call function

        ; System Exit
        exit    

    function:
        ;Prologue
        prologue

        ;Function Body
        print [rbp+16]
        print [rbp+24]
        print [rbp+32]
        print [rbp+40]

        ;Epilogue
        epilogue
