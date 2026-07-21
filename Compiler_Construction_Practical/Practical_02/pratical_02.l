%{
int comments = 0, keyword = 0, id = 0, word = 0, lines = 0, spaces = 0;
%}

%%
"/*"[^*]*"*/" {comments++;}
"//".* {comments++;}
[ \t]+
\n

"int" | "char" | "float" | "double" | "if" | "else" | "while"| "for" | "return" {keyword++;}
[a-zA-Z_][a-zA-Z0-9_] * {id++;word++;}
[0-9]+  {word++;}
.  {/* ignore other character */}
%%

int main() {
	yylex();
	
	printf("Comments: %d\n ",comments);
	printf("Keywords: %d\n ",keyword);
	printf("Identifiers: %d\n",id);
	printf("Words: %d\n",word);
	printf("Lines : %d\n",lines);
	printf("Spaces : %d\n ",spaces);
	
	return 0;

}

int yywrap(){

	return 1;
}


