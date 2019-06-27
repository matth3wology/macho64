global start
section .text
start:

    call open_file ; Open File

    mov r9, 10    ; Number of times to write message (10)
loop:
    cmp r9, 0
    je done       ; Break loop if R9=0

    mov rax, 0x2000004 ; 'write' syscall
    mov rdi, [rel fd] ; file descriptor
    lea rsi, [rel buffer] ; buffer address
    mov rdx, buffer.length ; buffer string length
    syscall

    dec r9
    jmp loop

done:
    call close_file
    call exit


open_file:
    mov rax, 0x2000005 ; 'open' syscall
    lea rdi, [rel fname] ; file name
    mov rsi, 0x0202 ; Create file and Write
    mov rdx, 0777o ; permissions set
    syscall
    mov [rel fd], rax
    ret

close_file:
    mov rax, 0x2000006 ; 'close' syscall
    mov rdi, [rel fd] ; file descriptor 
    syscall 
    ret

exit:
    mov rax, 0x2000001
    mov rdi, 0
    syscall


section .data
fname: db "data.txt", 0
fd: dq 0
buffer: db "Message..",0xa
.length: equ $-buffer 
