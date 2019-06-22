; Basic example of using the stack
; to restore a variable after
; a function call.

section .text
    global start

start:

    mov rax, old_message    ;Assign Old Message to RAX
    ;push rax                Push Old Message to the Stack
    sub rsp, 8
    mov [rsp], rax

    call setup_new_message  ;Call function to reassign RAX

    mov rbx, rax            ;Assign New Message to RBX

    mov rax, 0x2000004      ;Print the New Message
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 11
    syscall

    ;pop rbx                ;Assign Old Message to RAX
    mov rbx, [rsp]
    add rsp, 8

    mov rax, 0x2000004      ;Print the Old Message
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 11
    syscall

    mov rax, 0x2000001      ;Exit Program
    mov rdi, 0
    syscall

setup_new_message:          ;Assign New Message to RAX & Return
    mov rax, new_message
    ret

section .data

    old_message: db "OLDMESSAGE",0xa
    new_message: db "NEWMESSAGE",0xa