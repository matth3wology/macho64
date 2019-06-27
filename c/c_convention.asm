
    global _main
    extern _puts


    section .text

    struc person
        .name resb 40
        .email resb 40
    endstruc

    sneed istruc person
        at person.name, db "Jane Smith"
        at person.email, db "jsmith@yahoo.com"
    iend

_main:
    push rbx
    mov rbx, rsp

    lea rdi, [rel sneed + person.name]
    call _puts

    lea rdi, [rel sneed + person.email]
    call _puts
    
    mov rsp, rbx
    pop rbx
    ret
