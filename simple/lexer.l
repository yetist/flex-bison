%{
#include <stdio.h>
#include "parser.h"
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;
int fileno(FILE *stream);
%}
%option noyywrap
DIGIT    [0-9]
%%
"-"            { return MINUS; }
"+"            { return PLUS; }
"*"            { return MULT; }
"/"            { return DIV; }
"="            { return EQUAL; }
"("            { return L_PAREN; }
")"            { return R_PAREN; }
(\.{DIGIT}+)|({DIGIT}+(\.{DIGIT}*)?([eE][+-]?[0-9]+)?)   { yylval.dval = atof(yytext); return NUMBER; }

[ \t]+         { /* ignore spaces */ }
"\n"           { return END;}
.              { printf("Error at line %d: unrecognized symbol \"%s\"\n", yylloc.first_line, yytext); exit(0); }
%%
