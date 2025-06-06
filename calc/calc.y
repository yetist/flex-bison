/* calc */
%{
#include <stdio.h>
#include <stdio.h>
#include "lexer.h"
void yyerror(const char *msg);
%}
/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP
%%
calclist: /* empty rule */
        | calclist exp EOL { printf("= %d\n", $2); }
        ;
exp: factor { $$ = $1; }
   | exp ADD factor { $$ = $1 + $3; }
   | exp SUB factor { $$ = $1 - $3; }
   ;
factor: term { $$ = $1; }          /* 因子 */
      | factor MUL term { $$ = $1 * $3; }
      | factor DIV term { $$ = $1 / $3; }
      ;
term: NUMBER    { $$ = $1; }
    | ABS term  { $$ = $2 >= 0 ? $2 : - $2; }
    | OP exp CP { $$ = $2; }
    ;
%%
int main (int argc, char **argv)
{
  yyparse();
}

void yyerror(const char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
