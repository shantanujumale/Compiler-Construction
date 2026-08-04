%{
//Name: Shantanu Jumale    PRN: 24070521096
#include <stdio.h>
int count = 0;
%}

%%
\b[Aa][a-zA-Z0-9_]*\b    { count++; }
.|\n                    
%%

int main() {
    yylex();
    printf("Name: Shantanu Jumale    PRN: 24070521096\n");
    printf("Number of words starting with 'A': %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}
