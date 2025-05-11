######################################################################
# @author      : yetist (yetist@gmail.com)
# @file        : Makefile
# @created     : 星期日 5月 11, 2025 12:23:20 CST
######################################################################

CC=gcc
CFLAGS = -O2

calc: calc.c lexer.c
	$(CC) -o $@ $^ $(CFLAGS)

calc.h calc.c: calc.y
	bison -d -v -o calc.c $<

lexer.h lexer.c: lexer.l
	flex --header-file=lexer.h -o lexer.c lexer.l

.PHONY: clean

clean:
	rm -f lexer.{h,c} calc.{h,c,output} calc
