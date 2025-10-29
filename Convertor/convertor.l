%{

#include "convertor.tab.h"
extern void yyerror(const char *s);

%}

%%

[0-9]+(\.[0-9]+)? {
	yylval.fval = atof(yytext);
	return NUMAR;
}

kilometri|mile|metri|picioare|centimetri|inchi|kilograme|pounds|grame|uncii|secunde|minute|celsius|fahrenheit|kelvin|litri|galoane|metri_patrati|acri|calorii|kilocalorii|bari|atmosfere {
	yylval.sval = strdup(yytext); 
	return UNITATE;
}

in {
	return IN;
}

[ \t]+ ; /* ignora spatiile si taburile*/

\n  { return '\n'; }

.  { yyerror("Caracter necunoscut!"); }

%%

int yywrap(void) {
	return 1;
}