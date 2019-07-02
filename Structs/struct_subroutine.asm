    

struc data
    .name resb 50
    .email resb 50
endstruc

sneed: 
istruc data
    at data.name, db "Matthew Lee Sneed",0xa
    at data.email, db "msneed@radiancetech.com",0xa
iend

desmond: 
istruc data
    at data.name, db "Jane Smith",0xa
    at data.email, db "jsmith@gmail.com",0xa
iend

section .text
global start
start:
    
    lea rax, [rel sneed]
    call print_struct

    lea rax, [rel desmond]
    call print_struct

    call end

print_struct:
    mov rbx, rax

    mov rax, 0x2000004
    mov rdi, 1
    lea rsi, [rel rbx + data.name]
    mov rdx, 11
    syscall

    mov rax, 0x2000004
    mov rdi, 1
    lea rsi, [rel rbx + data.email]
    mov rdx, 17
    syscall
    
    ret

end: