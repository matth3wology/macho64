%include "macros/draxx.asm"

SYS_WRITE equ 0x2000004
SYS_EXIT equ 0x2000001

section .data

struc Customer
    .name resb 64
    .email resb 64
endstruc

sneed istruc Customer
    at Customer.name, db "John Smith",0xa
    at Customer.email, db "jsmith@example.com",0xa
iend

section .text

global start

start:

    print sneed + Customer.name
    print sneed + Customer.email

    exit