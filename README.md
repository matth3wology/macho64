# macho64
Working on Mac OSX 64 bit assembly. 

Compile and link a Nasm object.
```
nasm -f macho64 main.asm
ld -macosx_version_min 10.7.0 main.o -o main
```