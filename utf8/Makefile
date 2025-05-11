CC = gcc
OPT = -O2

utf8: parser.c lexer.c
	$(CC) $(OPT) $^ -o $@

parser.h parser.c: parser.y
	bison -d -v -o parser.c parser.y

lexer.h lexer.c: lexer.l
	flex --header-file=lexer.h -o lexer.c lexer.l

.PHONY: clean

clean:
	rm -f lexer.{h,c} parser.{h,c,output} utf8
