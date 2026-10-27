%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+      { yylval.num = atoi(yytext); return NUM; }
[ \t\n]+    ;
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }
.           { return yytext[0]; }

%%

int yywrap(void)
{
    return 1;
}

