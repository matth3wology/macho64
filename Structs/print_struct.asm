%include "macros/draxx.asm"

%macro system_print 1

    print %1 + System.name
    print %1 + System.model
    print %1 + System.serial

%endmacro


section .data
struc System
    .name resb 40
    .model resb 40
    .serial resb 40
    .os resb 20
endstruc

AMDF istruc System
    at System.name, db "AMDF",0xa,0
    at System.model, db "RS230",0xa,0
    at System.serial, db "1233AF9D0Z",0xa,0
    at System.os, db "Linux 4.2",0xa,0
iend

D12D istruc System
    at System.name, db "D12D",0xa,0
    at System.model, db "RS230",0xa,0
    at System.serial, db "1233AF9D0Z",0xa,0
    at System.os, db "Linux 4.2",0xa,0
iend

section .text
global start

start:
    
    mov  [AMDF + System.name],db "LMAO"
    system_print AMDF
    system_print D12D

    exit