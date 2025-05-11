CC = gcc
OPT = -O2 -Wall

simple: lexer.c parser.c
	$(CC) $(OPT) $^ -o $@

lexer.h lexer.c: lexer.l
	flex --header-file=lexer.h -o lexer.c lexer.l

parser.h parser.c: parser.y
	bison -d -v -o parser.c parser.y

.PHONY: clean

clean:
	rm -f lexer.{h,c} parser.{h,c,output} simple
