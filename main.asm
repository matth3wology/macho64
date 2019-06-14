%include 'macros/draxx.asm'

;;Fake Shell Program.
section .text
global start
start:

loop:

    print greeting
    read name

    jmp loop


section .data
    greeting db "bash>",0

section .bss
    name resb 30