%{
#include<stdio.h>
%}

%token NUM


%%
E:E'+'T|T;
T:T'*'F|F;
F:'('E')'|NUM;
%%

int yyerror(char*s){
	fprintf("Invalid Expression");
}

int main(){
	printf("Enter an Expression: ");
	yyparse();
	printf("Valid Expression: ");
	
	return 0;

}

