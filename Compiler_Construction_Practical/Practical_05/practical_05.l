%{
#include <stdio.h>
%}

%%

[A-Z]   { putchar(yytext[0] + 32); }
[a-z]   { putchar(yytext[0] - 32); }
.       { putchar(yytext[0]); }

%%

int main()
{
    yylex();
    printf("Shantanu Jumale Prn. 24070521096");
    return 0;
}

int yywrap()
{
    return 1;
}

