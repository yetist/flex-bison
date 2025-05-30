%{
#include "calc.h"
/*
  enum yytokentype {
    NUMBER = 258,
    ADD = 259,
    SUB = 260,
    MUL = 261,
    DIV = 262,
    ABS = 263,
    EOL = 264
  };
  int yylval;
*/
%}

%option noyywrap
%%
"+"     { return ADD;}
"-"     { return SUB;}
"*"     { return MUL;}
"/"     { return DIV;}
"|"     { return ABS;}
"("     { return OP;}
")"     { return CP;}
[0-9]+  { yylval = atoi(yytext); return NUMBER;}
0[xX][a-f0-9]+  { yylval = strtol(yytext, NULL, 16); return NUMBER;}
\n      { return EOL;}
[ \t]   { /* ignore empty char */}
"//".*  { /* ignore commment */}
.       { printf("Mystery character %c\n", *yytext);}
%%
/*
int main(int argc, char **argv)
{
    int tok;

    while(tok = yylex()) {
        printf("%d", tok);
        if (tok == NUMBER) {
            printf(" = %d\n", yylval);
        } else {
            printf("\n");
          }
      }
      return 0;
}
*/
