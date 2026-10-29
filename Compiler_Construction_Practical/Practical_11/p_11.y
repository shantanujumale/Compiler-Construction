%{
#include <stdio.h>
#include <stdlib.h>
int temp=1;
int yylex(void), yyerror(char *);
char *newtemp(){
    char *s=malloc(20);
    sprintf(s,"t%d",temp++);
    return s;
}
%}
%union { char *str; }
%token <str> NUM
%type <str> E T F G
%left '+' '-'
%left '*'
%%
E : E '+' T { $$=newtemp(); printf("%s = %s + %s\n",$$,$1,$3); }
  | E '-' T { $$=newtemp(); printf("%s = %s - %s\n",$$,$1,$3); }
  | T       { $$=$1; };
T : T '*' F { $$=newtemp(); printf("%s = %s * %s\n",$$,$1,$3); }
  | F       { $$=$1; };
F : G       { $$=$1; };
G : NUM     { $$=$1; };
%%
int main(){
	printf("Shantanu jumale \n");
    printf("Enter expression: ");
    yyparse();
    return 0;
}
int yyerror(char *s){
    printf("Invalid expression\n");
    return 0;
}
