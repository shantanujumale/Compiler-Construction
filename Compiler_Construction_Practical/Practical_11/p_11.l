//valid datatypes(int,float,char,double)
%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"char"                      { return CHAR; }
"int"                       { return INT; }
"float"                     { return FLOAT; }
"double"                    { return DOUBLE; }

"while"                     { return WHILE; }

"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }

[0-9]+"."[0-9]+[fF]        { return FLOAT_LITERAL; }
[0-9]+"."[0-9]+             { return DOUBLE_LITERAL; }
[0-9]+                      { return INT_LITERAL; }

\'([^\\\']|\\.)\'            { return CHAR_LITERAL; }

[a-zA-Z_][a-zA-Z0-9_]*      {
                                yylval.text = strdup(yytext);
                                return ID;
                            }

[ \t\r\n]+                  ;

.                           { return yytext[0]; }

%%

int yywrap(void)
{
    return 1;
}
