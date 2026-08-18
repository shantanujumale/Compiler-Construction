%{
#include <stdio.h>

char changeCase(char ch)
{
    if (ch >= 'a' && ch <= 'z')
        return ch - 32;

    if (ch >= 'A' && ch <= 'Z')
        return ch + 32;

    return ch;
}
%}

%%

[a-zA-Z]    { putchar(changeCase(yytext[0])); }

%%

int main()
{
    printf("Shantanu Jumale 24070521096\n");
    printf("Enter a Text: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

