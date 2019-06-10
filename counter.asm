
count_string:
    ;INC RAX until 0 in string
    cmp byte[rax],0
    jz count_string_done
    inc rax
    jmp count_string

count_string_done:
    ;Subtrax RBX from RAX to obtain the count
    sub rax, rbx
    ret_string