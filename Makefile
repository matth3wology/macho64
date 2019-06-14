all:
	nasm -f macho64 main.asm && ld -macosx_version_min 10.7.0 main.o -o main


run:
	./main


clean:
	rm main *.o