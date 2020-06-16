
%{
#include <stdio.h>
%}

ALFANUMERICO [A-Za-z0-9]+
CARACESPECIAIS [_\-.]*
EMAIL {ALFANUMERICO}({CARACESPECIAIS}{ALFANUMERICO})*[@]{ALFANUMERICO}({CARACESPECIAIS}{ALFANUMERICO}+)*

%%

{EMAIL}[.] {
 yytext[strlen(yytext) - 1] = '\0' ;
 printf("%s\n", yytext); }

{EMAIL} {
 printf("%s\n", yytext); }

{CARACESPECIAIS}{EMAIL};
[[:space:]]+ ;
[[:^space:]]+ ;

%%

int main() {
  yylex();
  return 0;
}
