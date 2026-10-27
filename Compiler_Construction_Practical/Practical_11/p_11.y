%{
#include <stdio.h>
#include <string.h>

char type1[20] = "";
char type2[20] = "";
int count = 0;
%}
	                      								
%option noyywrap

%%
"int"       {
                if (count == 0)
                    strcpy(type1, yytext);
                else
                    strcpy(type2, yytext);
                count++;
            }

"float"     {
                if (count == 0)
                    strcpy(type1, yytext);
                else
                    strcpy(type2, yytext);
                count++;
            }

"char"      {
                if (count == 0)
                    strcpy(type1, yytext);
                else
                    strcpy(type2, yytext);
                count++;
            }

"double"    {
                if (count == 0)
                    strcpy(type1, yytext);
                else
                    strcpy(type2, yytext);
                count++;
            }

[a-zA-Z_][a-zA-Z0-9_]*   { /* Identifier */ }

[ \t\n;,]+   { /* Ignore whitespace and separators */ }

.            { /* Ignore other characters */ }
%%

int main()
{
    printf("Enter two data types (e.g., int int or int float):\n");
    yylex();

    if (count >= 2)
    {
        if (strcmp(type1, type2) == 0)
            printf("Types match: %s and %s\n", type1, type2);
        else
            printf("Types do not match: %s and %s\n", type1, type2);
    }
    else
    {
        printf("Please enter two data types.\n");
    }

    return 0;
}


























































































































































































































































































































































