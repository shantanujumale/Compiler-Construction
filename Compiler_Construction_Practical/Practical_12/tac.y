%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);

int temp = 1;
char result[20];
%}

%union {
    int num;
    char *str;
}

%token <num> NUM
%type <str> expr

%left '+' '-'
%left '*' '/'

%%

input:
    expr
    {
        printf("x = %s\n", $1);
    }
    ;

expr:
    NUM
    {
        $$ = malloc(20);
        sprintf($$, "%d", $1);
    }
    | expr '+' expr
    {
        $$ = malloc(20);
        sprintf($$, "t%d", temp);
        printf("%s = %s + %s\n", $$, $1, $3);
        temp++;
    }
    | expr '-' expr
    {
        $$ = malloc(20);
        sprintf($$, "t%d", temp);
        printf("%s = %s - %s\n", $$, $1, $3);
        temp++;
    }
    | expr '*' expr
    {
        $$ = malloc(20);
        sprintf($$, "t%d", temp);
        printf("%s = %s * %s\n", $$, $1, $3);
        temp++;
    }
    | expr '/' expr
    {
        $$ = malloc(20);
        sprintf($$, "t%d", temp);
        printf("%s = %s / %s\n", $$, $1, $3);
        temp++;
    }
    | '(' expr ')'
    {
        $$ = $2;
    }
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid expression\n");
}

int main()
{
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}

