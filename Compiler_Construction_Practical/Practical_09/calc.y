%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex();
void yyerror(char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%right '^'

%%

input:
      input line
    |
    ;

line:
      '\n'
    | expr '\n'       { printf("Result = %d\n", $1); }
    | error '\n'      { printf("Error: Invalid Expression\n"); yyerrok; }
    ;

expr:
      NUMBER          { $$ = $1; }
    | expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    
    | expr '/' expr
      {
          if ($3 == 0)
          {
              printf("Error: Division by zero\n");
              $$ = 0;
          }
          else
          {
              $$ = $1 / $3;
          }
      }

    | expr '%' expr
      {
          if ($3 == 0)
          {
              printf("Error: Modulo by zero\n");
              $$ = 0;
          }
          else
          {
              $$ = $1 % $3;
          }
      }

    | expr '^' expr
      {
          $$ = (int)pow($1, $3);
      }
    ;

%%

void yyerror(char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Desk Calculator\n");
    printf("Enter expression: ");

    yyparse();

    return 0;
}

