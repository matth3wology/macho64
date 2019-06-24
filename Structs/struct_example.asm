section .data
struc Customer
        c_id resb 4
        c_name resb 64
        c_address resb 64
        c_balance resb 4
endstruc

calvin istruc Customer
        at c_id , dd 7
        at c_name , db "Calvin" ,
        at c_address , db " 12 Mockingbird Lane", 
        at c_balance , dd 12500
iend

section .text
global  _start
_start:
        xor             rax, rax
        mov             rax,1
        xor             rdi, rdi
        mov             rdi,1
        xor             rsi,rsi
        mov             rsi, calvin + c_name ;remember you are using the address of calvin and moving all the way up to the address of c_name.
        mov             rdx, 7 
        syscall

        xor             rax, rax
        mov             rax,1
        xor             rdi, rdi
        mov             rdi,1
        xor             rsi,rsi
        mov             rsi, calvin + c_address
        mov             rdx, 24 
        syscall

        xor             rax,rax
        mov             rax,60
        xor             rdi,rdi
        syscall