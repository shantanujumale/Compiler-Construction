%{
#include <stdio.h>
%}

%token NUMBER

%%

stmt:
      stmt expr '\n' { printf("Result: %d\n", $2); }
    |
    ;

expr:
      NUMBER          { $$ = $1; }
    | expr expr '+'    { $$ = $1 + $2; }
    | expr expr '*'    { $$ = $1 * $2; }
    ;

%%

void yyerror(char *s)
{
    printf("Error\n");
}

int main()
{
    yyparse();
    return 0;
}

