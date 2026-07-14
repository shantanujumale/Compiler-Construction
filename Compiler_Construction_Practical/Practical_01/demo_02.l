%{
#include<stdio.h>
int count = 0;
%}

%%
pen { count++;}
.|\n {}
%%


int main(){
	
	printf("Enter a paragraph: ");
	yylex();		
	printf("The Frequency of word is : %d\n",count);	
return 0;
}

int yywrap(){
return 1;
}
