%{
#include <stdio.h>
#include <stdlib.h>


void decimalToHex(char *str)
{
    int n = atoi(str);

    printf("Decimal     : %d\n", n);
    printf("Hexadecimal : %X\n", n);
}
%}

%%

[0-9]+      { decimalToHex(yytext); }

\n          ;
.           { printf("Invalid input\n"); }

%%

int main()
{
    printf("Enter a decimal number: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

