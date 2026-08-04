%{
#include <stdio.h>
int count = 0;
%}

%%

[Aa][a-zA-Z]*	{ count++; } //counts only words
[Aa].*	{ count++; } //counts identifiers etc
.|\n	;

%%

int main() {
	printf("Name: Shantanu Jumale    PRN: 24070521096\n");
	printf("Enter a paragraph: ");
	yylex();
	printf(" Number of words starting with 'A': %d\n", count);
	return 0;
}

int yywrap() {
	return 1;
}
